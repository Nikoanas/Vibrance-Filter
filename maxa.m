function [c ] = maxa(a,b)
%���������� �� ������� ������� ���� ��� ��������� ��� ������� a & b
% �� � ������� ���� ����������� �� �������� ����, ���� � ������ �� ����� ��� ���� ��������
[M,N]=size(a);
a=double(a);b=double(b);
c=b;
    for i=1:M
        for j=1:N
            if abs(a(i,j))>=abs(b(i,j))
                c(i,j)=a(i,j);
           end
        end
    end
end