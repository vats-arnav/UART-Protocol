module baud(clk,baud_clk);

    input clk;
     (*mark_debug = "true"*) output reg baud_clk;
    integer count =0;
      
      always@(posedge clk)
      begin
                    if (count<44)
                    begin 
                    baud_clk <=0;
                    count <= count +1;
                    end 
                    else if(count<87)
                    begin
                    baud_clk <= 1;
                    count <= count +1;
                    end
                    else 
                    begin
                    count <=0;
                    baud_clk <= baud_clk;
                    end
     end
endmodule