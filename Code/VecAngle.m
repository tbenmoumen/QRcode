function angle = VecAngle(u, v)
% returns the angle between 2 vectors

uv = u(1)*v(1) + u(2)*v(2);
Normu = sqrt((u(1)).^2 + ((u(2)).^2));
Normv = sqrt((v(1)).^2 + ((v(2)).^2));
uv/(Normu * Normv);
angle =acos(uv/(Normu * Normv));

if(u(1)*v(2)- v(1)*u(2) < 0)
    angle = -angle;
end

