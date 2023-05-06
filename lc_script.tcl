read_lib SRAM_SP_2048_128_tt_1.0_25.0_syn.lib


read_lib ROM0_4096_64_tt_1.0_25.0_syn.lib
read_lib ROM1_4096_128_tt_1.0_25.0_syn.lib
read_lib ROM2_4096_128_tt_1.0_25.0_syn.lib
read_lib ROM3_4096_128_tt_1.0_25.0_syn.lib
read_lib ROM4_4096_128_tt_1.0_25.0_syn.lib
read_lib ROM5_4096_128_tt_1.0_25.0_syn.lib
read_lib ROM6_4096_128_tt_1.0_25.0_syn.lib
read_lib ROM7_4096_128_tt_1.0_25.0_syn.lib

write_lib SRAM_SP_2048_128 -format db -output SRAM_SP_2048_128.db


write_lib ROM0_4096_64  -format db -output ROM0_4096_64.db
write_lib ROM1_4096_128 -format db -output ROM1_4096_128.db
write_lib ROM2_4096_128 -format db -output ROM2_4096_128.db
write_lib ROM3_4096_128 -format db -output ROM3_4096_128.db
write_lib ROM4_4096_128 -format db -output ROM4_4096_128.db
write_lib ROM5_4096_128 -format db -output ROM5_4096_128.db
write_lib ROM6_4096_128 -format db -output ROM6_4096_128.db
write_lib ROM7_4096_128 -format db -output ROM7_4096_128.db

exit
