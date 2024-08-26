module rx_tb();

    output reg [7:0]data;
    input baud_clk;
    input rx;
    output reg rx_st;
    integer bits;
    input reset;
    
    Rx uut(.data(data),.baud(baud_clk),.rx(rx),.reset(reset),.rx_st(rx_st));
   
    initial begin
    clk <= 1'b1;
    tx_en <= 1'b1; 
    data[7:0] <= 8'b01011010;  
    end
    
    always
    #10 clk = ~clk;
    
endmodule

