module baud_gen_rx(clk,baud_rx);

    input clk;
    output reg baud_rx;
    integer count =0;
      
      always@(posedge clk)
      begin
                    if (count<4)
                    begin 
                    baud_rx <=0;
                    count <= count +1;
                    end 
                    else if(count<9)
                    begin
                    baud_rx <= 1;
                    count <= count +1;
                    end
                    else 
                    begin
                    count <=0;
                    baud_rx <= baud_rx;
                    end
     end
endmodule