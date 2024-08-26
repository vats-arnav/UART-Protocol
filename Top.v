module Top(tx,clk_p,clk_n,dip_switch,rx);
    reg tx_en;
    input dip_switch;
    input clk_p;
    input clk_n;
       
    input rx;
    wire rx_st;    
    wire [7:0]data_rx;

    reg data;
    output tx;
    parameter tx_idle = 3'b000;
    parameter tx_data = 3'b001;
    parameter tx_data1 = 3'b010;
    parameter tx_data2 = 3'b011;
    parameter tx_data3 = 3'b100;             

    reg l1=1'b1,l2=1'b1,l3=1'b1,l4=1'b1;
    parameter led1 = 8'b10101010;
    parameter led2 = 8'b11110000;
    parameter led3 = 8'b11111111;
    parameter led4 = 8'b00001111;
    parameter led5 = 8'b01010101; 
    (*mark_debug = "true"*) reg[7:0] mode_led = 8'b00000000;
    wire baud;
    wire baud_rx;
    
     wire data_st;
    reg reset_p = 1'b0;
    
    
     reg[1:0] mode = 3'b000;
    wire clk;
    wire locked;

  clk_wiz_0 clock_gen
   (
    // Clock out ports
    .clk_out1(clk),     // output clk_out1
    // Status and control signals
    .reset(reset_p), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1_p(clk_p),    // input clk_in1_p
    .clk_in1_n(clk_n));    // input clk_in1_n
    
    baud_gen b(.clk(clk),.baud(baud));
    baud_gen_rx c(.clk(clk),.baud_rx(baud_rx));
    transmitter t(.data(data),.tx(tx),.tx_en(tx_en),.baud(baud),.data_st(data_st),.reset(reset_p));
    Rx Rx(.data_rx(data_rx),.baud_rx(baud_rx),.rx(rx),.reset(reset_p),.rx_st(rx_st));
    always@(posedge baud_rx)
        begin
        if(rx_st ==1)
        begin
       case(mode_led)
            led1: begin
                       l1 <= 1;
             end
            led2: begin
                      l2 <= 1;
                  end
            led3: begin
                       l3 <= 1;
                  end
            led4: begin
                        l4 <= 1;
                  end  
            led4: begin
                        l1 <= 1;
                        l3 <=1;
                  end  
                                    
             default:begin
                         l1 <= 1;
                         l2 <= 1;
                         l3 <= 1;
                         l4 <= 1;
                  end

        endcase
        end
end

    always@(posedge baud)
      begin
      case(mode)
           tx_idle: begin

                if(dip_switch == 1)
                begin 
                    mode <= tx_data;
                end
                else
                begin 
                    mode <= tx_idle;
                end
             end
            tx_data: begin
                  tx_en <= 1'b1; 
                  data <= 8'b11111111;
                  mode <= tx_data1;
                  end
            tx_data1: begin
                  if (data_st == 1)
                  begin
                    tx_en <= 1'b1; 
                    data <= 8'hBB;
                    mode <= tx_data2;
                  end  
                  else
                  begin
                   tx_en <= 1'b0; 
                   mode <= tx_data1;
                  end
                  end   
                  
            tx_data2: begin
                  if (data_st == 1)
                  begin
                    tx_en <= 1'b1; 
                    data <= 8'hCC;
                    mode <= tx_data3;
                  end  
                  else
                  begin
                   tx_en <= 1'b0; 
                   mode <= tx_data2;
                  end
                  end  
                  
            tx_data3: begin
                  if (data_st == 1)
                  begin
                    tx_en <= 1'b1;                   
                    data <= 8'b10110010;

                    mode <= tx_idle;
                  end  
                  else
                  begin
                   tx_en <= 1'b0; 
                   mode <= tx_data3;
                  end
                 end                                      
             default:begin
             begin
                  tx_en <= 1'b0;                
                  mode <= tx_idle;
                  end
       end
endcase
end          
endmodule

        

