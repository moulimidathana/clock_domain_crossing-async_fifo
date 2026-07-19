verilator --binary -j 0 -Wall fifo.v async_fifo_tb.v --top async_fifo_tb --timing --CFLAGS "-std=c++20" --trace

cd obj_dir || { echo "obj_dir not found"; exit 1 ;}

make -f Vasync_fifo_tb.mk Vasync_fifo_tb || { echo "compilation failed"; exit 1 ; }

./Vasync_fifo_tb || { echo "simulation failed" ; exit 1; }

gtkwave dump.vcd
