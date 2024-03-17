/// @desc DrawSetText(color, font, halign, valign)
/// @arg color
/// @arg font
/// @arg halign
/// @arg valign

// Allows one line setup of major text drawing variables
// Requiring all four prevents silly codes from forgetting one
// And therefore creating a dumb dependency on other event calls.

function DrawSetText(color,font,halign,valign){
	draw_set_color(color);
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
}