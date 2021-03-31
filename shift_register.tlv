\m4_TLV_version 1d: tl-x.org
\SV

   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
   /* verilator lint_on WIDTH */
  
\TLV
   /dummy
      $reset = *reset;
      $bit3 = $reset ? 0 : >>1$bit2;
      $bit2 = $reset ? 0 : >>1$bit1;
      $bit1 = $reset ? 0 : >>1$bit0;
      $bit0 = $reset ? 0 : $input1;
      // Assert these to end simulation (before Makerchip cycle limit).
      *passed = *cyc_cnt > 40;
      *failed = 1'b0;

      \viz_alpha
         initEach(){
         console.log("entered")
         let title = new fabric.Text ("Shift Register", {
          left: -150,
          top: -250,
          fontsize: 100,
          fontFamily: "Courier New",
         })
         let outer_block = new fabric.Rect({
          originX: "center",
          originY: "center",
          width: 500,
          height: 550,
          fill: "#fcf5ee"
         })
         let r_input = new fabric.Text("0--",{
          left: -350,
          top: 0,
          fontsize: 20,
          fontFamily: "Courier New"
         })
         let r_out0 = new fabric.Text("-->0",{
          left: 280,
          top: -160,
          fontsize: 20,
          fontFamily: "Courier New"
         })
         let r_out1 = new fabric.Text("-->1",{
          left: 280,
          top: -40,
          fontsize: 20,
          fontFamily: "Courier New"
         })
         let r_out2 = new fabric.Text("-->2",{
          left: 280,
          top: 80,
          fontsize: 20,
          fontFamily: "Courier New"
         })
         let r_out3 = new fabric.Text("-->3",{
          left: 280,
          top: 200,
          fontsize: 20,
          fontFamily: "Courier New"
         })
         return {
         objects : {outer_block, title, r_input, r_out0, r_out1, r_out2, r_out3}
                   };
         },
         renderEach() {
          this.getInitObject("r_input").setText('$input1'.asBinaryStr()+"--")
          this.getInitObject("r_out0").setText("-->"+'$bit0'.asBinaryStr())
          this.getInitObject("r_out1").setText("-->"+'$bit1'.asBinaryStr())
          this.getInitObject("r_out2").setText("-->"+'$bit2'.asBinaryStr())
          this.getInitObject("r_out3").setText("-->"+'$bit3'.asBinaryStr())
         }
\SV
   endmodule
