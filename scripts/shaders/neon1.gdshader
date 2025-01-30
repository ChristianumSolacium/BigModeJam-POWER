shader_type canvas_item;

uniform vec4 neon_color = vec4(1.0, 0.3, 0.8, 1.0); // Colore neon
uniform float outline_size : hint_range(1, 10) = 3.0; // Dimensione dell'outline
uniform float glow_intensity : hint_range(0, 5) = 1.5; // Intensità del bagliore
uniform float time_speed : hint_range(0, 5) = 1.0; // Velocità animazione

void fragment() {
    vec4 base_color = texture(TEXTURE, UV); // Colore base del testo
    float distance_field = base_color.a; // Usa l'alpha per l'outline

    // Calcola l'outline con un effetto sfumato
    float outline = smoothstep(0.5 - outline_size * 0.01, 0.5, distance_field);
    
    // Anima il glow usando il tempo
    float glow = sin(TIME * time_speed) * 0.5 + 0.5;
    
    // Combina outline e glow
    vec4 outline_color = vec4(neon_color.rgb * glow_intensity * glow, outline * neon_color.a);

    // Output finale
    COLOR = mix(base_color, outline_color, outline);
}
