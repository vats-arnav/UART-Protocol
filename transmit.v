module transmitter(data,tx,tx_en,baud,data_st,reset);


    input [7:0]data;
    input baud;
    input tx_en;
    input reset;
    reg [7:0]data_current;
    output integer tx = 1'b1;
    output integer data_st;
 
       
    parameter tx_idle = 2'b00;
    parameter tx_start = 2'b01;
    parameter tx_data = 2'b10;
    parameter tx_stop = 2'b11;
    integer index=0;
    reg[1:0] mode = 2'b00;
    
    always@(posedge baud)
      begin
      if(reset == 1'b1)
      begin 
      index <= 0;
      data_st <=0;
      mode <= tx_idle;
       end
       else
       begin
         case(mode)
             tx_idle: begin
                         data_st <= 0;
                         tx <= 1'b1;
                         index = 0; 
                         if(tx_en==1)
                           begin
                              mode <= tx_start;
                           end
                         else
                           begin
                              mode <= tx_idle;
                           end
                       end
             
             tx_start: begin
                          tx <= 1'b0; 
                          data_current<=data;
                          data_st <= 0;
                          mode <= tx_data;
                          end

             tx_data: begin
                          if(index<7)
                              begin
                               tx<=data_current[index];
                               index <= index+1;
                               mode <= tx_data;
                                end
                           else
                               begin
                                   tx<=data_current[7];
                                   index <= 0;
                                   mode <= tx_stop;
                                 end
                           end

             tx_stop: begin
                          tx <= 1'b1; 
                          data_st <= 1;
                          mode <= tx_idle;
                          end
             default: begin
                          mode <= tx_idle;
                          index <= 0;
                          data_st <= 0;
                      end
         
         endcase
       end
    end
endmodule 
