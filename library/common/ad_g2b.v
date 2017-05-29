// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2017 (c) Analog Devices, Inc. All rights reserved.
//
// This core  is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory of
//      the repository (LICENSE_GPL2), and at: <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license as noted in the top level directory, or on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module ad_g2b #(

  parameter DATA_WIDTH = 8) (

  input       [DATA_WIDTH-1:0]    din,
  output      [DATA_WIDTH-1:0]    dout);

  function [DATA_WIDTH-1:0] g2b;
    input [DATA_WIDTH-1:0] g;
    integer i;
    begin
      g2b[DATA_WIDTH-1] = g[DATA_WIDTH-1];
      for (i = DATA_WIDTH-1; i > 0; i = i -1) begin
        g2b[i-1] = g2b[i] ^ g[i-1];
      end
    end
  endfunction

  assign dout = g2b(din);

endmodule
