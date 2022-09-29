module decoder38_tb;
logic [7:0] out;
logic en;
logic [2:0] in;
integer i;

decoder38 DUT(
	.in(in),
	.out(out),
	.en(en)
);

initial begin  
 $monitor( "en=%b, in=%d, out=%b ", en, in, out);
   for (i = 0; i < 16; i = i+1) 
        begin
           {en, in} = i;
            #5;
        end
end
endmodule