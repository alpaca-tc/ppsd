#include "ppsd.h"

void
Init_ppsd(void)
{
	VALUE rb_mPPSD = rb_define_module("PPSD");

	// Image
	VALUE Image = rb_define_class_under(rb_mPPSD, "Image", rb_cObject);
	rb_define_method(Image, "hello", ppsd_image_hello, 0);
	/* VALUE Image = rb_define_class_under(rb_mPPSD, "Image", rb_cObject); */
	/* rb_define_method(Image, "hello", ppsd_image_hello, 0); */
}
