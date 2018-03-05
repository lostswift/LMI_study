clc;
clear;
for i=0:0.01:1
    flag=test_delay_gama_lmi(i);
    if flag~=1
       continue;
    if flag==1
        disp(i);
    end
    end
    if i==1
       sprintf('not found');
    end
end