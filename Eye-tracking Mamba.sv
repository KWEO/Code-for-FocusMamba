class chessposition;
        rand bit [2:0] row;
        rand bit [2:0] col;

        constraint valid_range{
                row inside {[0:7]};
                col inside {[0:7]};
        }
        
        constraint not_eq{
                row != col;
        }
        function void display();
                $dispaly("chess piece position: row = %0d, col = %0d", row, col);
        endfunction
endclass

module tb;
        initial begin 
                chessposition pos = new();
                if (pos.randomize()) begin
                        pos.display()
                end else begin
                        $display("pos randomize failed!")
                end
                $finish
        end
endmodule