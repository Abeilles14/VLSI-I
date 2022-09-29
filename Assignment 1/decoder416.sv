module decoder416 (
   input logic [3:0] in,
   output logic [15:0] out,
   input logic en
);
   parameter tmp = 16'b0000_0000_0000_0001;

   always_comb begin
      if (en) begin
         out = (in == 4'b0000) ? tmp   :
                     (in == 4'b0001) ? tmp<<1:
                     (in == 4'b0010) ? tmp<<2:
                     (in == 4'b0011) ? tmp<<3:
                     (in == 4'b0100) ? tmp<<4:
                     (in == 4'b0101) ? tmp<<5:
                     (in == 4'b0110) ? tmp<<6:
                     (in == 4'b0111) ? tmp<<7:
                     (in == 4'b1000) ? tmp<<8:
                     (in == 4'b1001) ? tmp<<9:
                     (in == 4'b1010) ? tmp<<10:
                     (in == 4'b1011) ? tmp<<11:
                     (in == 4'b1100) ? tmp<<12:
                     (in == 4'b1101) ? tmp<<13:
                     (in == 4'b1110) ? tmp<<14:
                     (in == 4'b1111) ? tmp<<15: 16'bx;
      end
      else
         out = 16'bx;
   end

endmodule