TTS generation instructions and next steps

Archivos SSML de muestra:
- hantavirus-video/tts_samples/phrase_A_ssml.xml
- hantavirus-video/tts_samples/phrase_B_ssml.xml
- hantavirus-video/tts_samples/phrase_C_ssml.xml

Scripts de ejemplo para generar WAV:
- hantavirus-video/tts_samples/generate_tts_googlecloud.sh
- hantavirus-video/tts_samples/generate_tts_aws.sh

Opciones para producir la muestra TTS:
1) Que yo genere el audio usando un servicio externo (Google Cloud TTS o Amazon Polly). Para que yo lo haga, debes proporcionar las credenciales de API o un token temporal en este chat (no recomendado por seguridad). Alternativamente, puedo proporcionarte un enlace para subir credenciales de forma segura.

2) Ejecutas localmente uno de los scripts con tus credenciales. Ejemplo (Google Cloud):
   chmod +x hantavirus-video/tts_samples/generate_tts_googlecloud.sh
   ./hantavirus-video/tts_samples/generate_tts_googlecloud.sh hantavirus-video/tts_samples/phrase_A_ssml.xml hantavirus-video/dist/sample_phrase_A.wav

3) Si prefieres, puedo solicitar y usar un servicio de TTS en tu nombre sin que compartas credenciales: yo reportaría al proveedor y te pasaría los WAV resultantes. Eso requiere autorización explícita y puede implicar costos.

Una vez tengas los WAV de muestra (phrase_A/B/C), súbelos a:
- hantavirus-video/dist/sample_phrase_A.wav
- hantavirus-video/dist/sample_phrase_B.wav
- hantavirus-video/dist/sample_phrase_C.wav

Cuando los tenga en el repo, generaré la locución completa (ensamblada) y procederé al montaje preliminar del video 16:9.

Si deseas que yo genere la muestra ahora usando TTS externo, responde "Genera TTS externo" y dime qué proveedor prefieres (Google o AWS) y si autorizas que proceda en tu nombre.
