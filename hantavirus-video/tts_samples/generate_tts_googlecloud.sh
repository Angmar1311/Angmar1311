#!/bin/bash
# Script de ejemplo para generar TTS con Google Cloud Text‑to‑Speech (REST API)
# Requiere tener configurado: GOOGLE_APPLICATION_CREDENTIALS o un token de acceso
# Salida: WAV lineal 48 kHz (LINEAR16)

SSML_FILE="$1"  # path al archivo SSML
OUT_FILE="$2"   # path de salida WAV

if [ -z "$SSML_FILE" ] || [ -z "$OUT_FILE" ]; then
  echo "Uso: $0 archivo_ssml.xml salida.wav"
  exit 1
fi

SSML_CONTENT=$(sed ':a;N;$!ba;s/"/\\\"/g' "$SSML_FILE")

REQUEST_PAYLOAD=$(cat <<EOF
{
  "input": { "ssml": "$(echo "$SSML_CONTENT")" },
  "voice": { "languageCode": "es-ES", "name": "es-ES-Wavenet-F" },
  "audioConfig": { "audioEncoding": "LINEAR16", "sampleRateHertz": 48000 }
}
EOF
)

# Usar token de autorización obtenido por gcloud or service account
ACCESS_TOKEN=$(gcloud auth application-default print-access-token 2>/dev/null)
if [ -z "$ACCESS_TOKEN" ]; then
  echo "No se encontró token de acceso. Asegúrate de ejecutar 'gcloud auth application-default login' o exportar GOOGLE_APPLICATION_CREDENTIALS.";
  exit 1
fi

curl -s -X POST \
  -H "Authorization: Bearer ${ACCESS_TOKEN}" \
  -H "Content-Type: application/json; charset=utf-8" \
  --data "$REQUEST_PAYLOAD" \
  "https://texttospeech.googleapis.com/v1/text:synthesize" \
| jq -r '.audioContent' | base64 --decode > "$OUT_FILE"

echo "Generado: $OUT_FILE"
