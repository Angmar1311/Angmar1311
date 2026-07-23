# AWS Polly example (AWS CLI)
# Requires AWS CLI configured with credentials and region
# Produces WAV PCM 48 kHz
# Uso: ./generate_tts_aws.sh input_ssml.xml salida.wav

SSML_FILE="$1"
OUT_FILE="$2"

if [ -z "$SSML_FILE" ] || [ -z "$OUT_FILE" ]; then
  echo "Uso: $0 archivo_ssml.xml salida.wav"
  exit 1
fi

aws polly synthesize-speech \
  --text-type ssml \
  --ssml file://"$SSML_FILE" \
  --voice-id Conchita \
  --output-format pcm \
  --sample-rate 48000 \
  "$OUT_FILE".raw

# Convert raw PCM to WAV (requires sox)
sox -r 48000 -e signed -b 16 -c 1 "$OUT_FILE.raw" -t wav "$OUT_FILE"
rm "$OUT_FILE.raw"

echo "Generado: $OUT_FILE"
