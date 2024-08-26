module baud_gen(clk,baud);

    input clk;
    output reg baud;
    integer count =0;
      
      always@(posedge clk)
      begin
                    if (count<44)
                    begin 
                    baud <=0;
                    count <= count +1;
                    end 
                    else if(count<87)
                    begin
                    baud <= 1;
                    count <= count +1;
                    end
                    else 
                    begin
                    count <=0;
                    baud <= baud;
                    end
                    end
endmodule
