function F2
hold on; grid on;
title('F = [0; 0; z] vektormező fluxusa kúpon');
xlabel('x');
ylabel('y');
zlabel('z');
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
zlim([0 1.5]);

%kúp
r = linspace(0, 1);
th = linspace(0, 2*pi);
[R,T] = meshgrid(r, th);
X = R.*cos(T);
Y = R.*sin(T);
Z = R;
surf(X, Y, Z, 'FaceAlpha', 1, 'EdgeColor', 'none')

%vektormező
[x1, y1, z1] = meshgrid(-1:0.2:1);
quiver3(x1, y1, z1, zeros(size(x1)), zeros(size(x1)), z1, 'LineWidth', 1.2);

%sík
[x2, y2] = meshgrid(-1.2:0.4:1.2);
z2 = ones(size(x2));
surf(x2, y2, z2, 'FaceAlpha', 0.5);

%felületi integrál
syms x y z u v real
s = [u*cos(v); u*sin(v); u];
F = [0; 0; z];
r = [x; y; z];
integrand = simplify(dot(subs(F, r, s), cross(diff(s, u), diff(s, v))));
I = int(int(integrand, u, [0 1]), v, [0 2*pi]);
fprintf('Az F = [0; 0; z] vektormező fluxusa a megadott felületen: I = %e.\n', I);

%kúp máshogy
%[X,Y,Z] = meshgrid(-1:0.1:1, -1:0.1:1, 0:0.1:1);
%a=1;
%b=1;
%c=1;
%V = X.^2/a^2 + Y.^2/b^2 - Z.^2/c^2;
%p=patch(isosurface(X,Y,Z,V,0)); 
%set(p,'FaceColor','red','EdgeColor','none', 'FaceAlpha', 0.5);
%daspect([1 1 1])
%view(3);
%camlight
end