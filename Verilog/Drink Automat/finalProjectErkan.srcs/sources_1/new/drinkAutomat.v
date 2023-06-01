`timescale 1ns / 1ps


module drinkAutomat(
    input clk,
    input [9:0] card_currency,
    input [3:0] selection,
    output reg [4:0] water_storage_amount, coke_storage_amount, ice_tea_storage_amount,energy_drink_storage_amount,
    output reg [9:0] new_card_currency,
    output reg allow_access
    );
    
    initial begin
    water_storage_amount=5'b01101;
    coke_storage_amount=5'b00011;
    ice_tea_storage_amount=5'b00011;
    energy_drink_storage_amount=5'b00001;
    end
    
    always@(posedge clk)
    begin
        if(selection == 1'd1)
        begin
            if(water_storage_amount>1'b0)
            begin
                if(card_currency>=3'd3)
                begin
                allow_access=1;
                water_storage_amount=water_storage_amount-1;
                new_card_currency=card_currency-2'd3;
                end
                else
                begin
                allow_access=0;
                end
            end
            else
            begin
            allow_access=0;
            end
        end
           
     if(selection == 2'd2)
         begin
             if(coke_storage_amount>1'b0)
             begin;
                 if(card_currency>=3'd7)
                 begin
                 allow_access=1;
                 coke_storage_amount=coke_storage_amount-1;
                 new_card_currency=card_currency-3'd7;
                 end
                 else
                 begin
                 allow_access=0;
                 end
             end
             else
             begin
             allow_access=0;
             end
         end
     
     if(selection == 2'd3)
     begin
         if(ice_tea_storage_amount>1'b0)
         begin
             if(card_currency>=3'd7)
             begin
             allow_access=1;
             ice_tea_storage_amount=ice_tea_storage_amount-1;
             new_card_currency=card_currency-3'd7;
             end
             else 
             begin
             allow_access=0;
             end
         end
         else 
         begin
         allow_access=0;
         end
     end
     
     if(selection == 3'd4)
     begin
         if(energy_drink_storage_amount>1'b0)
         begin
             if(card_currency>=4'd15)
             begin
             allow_access=1;
             energy_drink_storage_amount=energy_drink_storage_amount-1;
             new_card_currency=card_currency-4'd15;
             end
             else 
             begin
             allow_access=0;
             new_card_currency=card_currency;
             end
         end
     end
     else 
     begin
     allow_access=0;
     end
   end
endmodule