model cosCosFun
  parameter Real x = 0;
  parameter Real y = 0;
  parameter Real z = 0;
  Real v;
  Real w;
equation
  v = -cos(x-1) + ((x-1)/10)^2 - cos(y-2) + ((y-2)/10)^2 + ((z-3)/10)^2;
  der(w) = 1;
end cosCosFun;