require 'mkmf'

$CFLAGS << ' -Wall'
create_makefile('ppsd/ppsd')
