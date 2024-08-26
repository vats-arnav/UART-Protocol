module Rx(baud_rx,rx,reset,rx_st,data_rx);
    (*mark_debug = "true"*)output reg [7:0]data_rx;
    
    (*mark_debug = "true"*)input baud_rx;
    (*mark_debug = "true"*)input rx;
    (*mark_debug = "true"*)output reg rx_st;
    (*mark_debug = "true"*)integer bits;
    input reset;
    (*mark_debug = "true"*) integer counter;
    parameter rx_idle = 2'b00;
    parameter rx_start = 2'b01;
    parameter rx_data = 2'b10;
    parameter rx_stop = 2'b11;
    (*mark_debug = "true"*)reg[1:0] mode = 2'b00;
    
    
    always@(posedge baud_rx)
      begin
      if(reset == 1'b1)
      begin 
      bits <= 0;
      rx_st <=0;
      mode <= rx_idle;
      end
       else
       begin
         case(mode)
             rx_idle: begin
                         counter <=0;                                                
                         rx_st <= 0;
                         bits = 0; 
                         if(rx ==0)
                           begin
                              mode <= rx_start;
                           end
                         else
                           begin
                              mode <= rx_idle;
                           end
                       end
             
             rx_start: begin
                          if(counter <20)
                          begin
                          counter <= counter +1;
                          end
                          else
                          begin
                          mode <= rx_data;
                          bits <=1;
                          data_rx[0]<=rx;
                          counter <=0;
                          end
                       end

             rx_data: begin
                          if(bits<8)
                              begin
                               if(counter <8)
                                    begin
                               counter <= counter +1;
                                    end
                               else
                                    begin
                               counter <=0;
                               data_rx[bits]<=rx;
                               bits <= bits +1;                              
                               mode <= rx_data;
                                    end
                                end
                           else
                               begin                             
                                   counter <=0;                                   
                                   mode <= rx_stop;
                            end
                        end

             rx_stop: begin
                        if(counter <8)
                            begin
                               counter <= counter +1;
                             end
                         else
                              begin         
                                 rx_st <= 1;
                                 mode <= rx_idle;
                               end
                      end
             default: begin
                          mode <= rx_idle;
                          bits <= 0;
                          rx_st <= 0;
                      end      
         endcase
       end
    end
endmodule 

