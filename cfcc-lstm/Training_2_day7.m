function weight_global = Training_2_day7(date_1,date_2,date_3,date_4,testdata,day)

%day=6;
yuce=7;
    for m = date_3:date_1
        for n = date_4:date_2
                for num = 1:yuce 
                    ij=1;
                    for it=-2:2
                        for jt=-2:2
                            t=testdata(m+it,n+jt,day+num);
                            train_data(ij,num,m,n)=t;
                            ij=ij+1;
                        end
                    end
                end
            train_data(:,:,m,n) = train_data(:,:,m,n)...
                /3248.1;  %归一�?
        end
    end


group_x_num = 1;
group_y_num = 1;
Error=0;
d=1;
pred=zeros(25,yuce,group_x_num*group_y_num);
ground=zeros(group_x_num*group_y_num,yuce);
out_f=train_data;
weight_global=zeros(25,500,300);
for data_1=date_3:date_1
    for data_3=date_4:date_2  
% %                 profile on;
        for group_x = 1:group_x_num
            for group_y = 1:group_y_num
                pred(:,:,group_x*group_y_num+group_y-group_y_num)=out_f(:,:,data_1+group_x-1,data_3+group_y-1);
                for date =1:yuce
                    ground(group_x*group_y_num+group_y-group_y_num,date)=testdata(data_1+group_x-1,data_3+group_y-1,date+day+yuce-1);
                end
            end
        end
        pred(isnan(pred))=0;
        ground(isnan(ground))=0;
        train_data=pred;
%         train_data=train_data/3248.1;
        test_data=ground;
        test_data=double(int16(test_data));
        test_data=test_data/3248.1;
        % weight=rand(1,25)/ab;
        weight = zeros(1,25);
        for fuzhi=1:1
        weight(1,1:25)=[-0.025,-0.025,-0.025,-0.025,-0.025,-0.025,0.075,0.1,0.075,-0.025,-0.025,0.1,0.85,0.1,-0.025,-0.025,0.075,0.1,0.075,-0.025,-0.025,-0.025,-0.025,-0.025,-0.025];
        end
        Error_Cost = zeros(1,1000);
        cost_gate=1e-6;
        yita=0.05;
        for iter=1:1000
            hidden_input=weight*train_data;
            hidden=tanh(hidden_input);
            Error=hidden-test_data;
            err=sum(abs(Error));
            Error_Cost(1,iter)=err/(group_y_num*group_x_num);
            delta_hidden=hidden;
            delta_weight=2*Error*(train_data)';
            weight=weight-yita*delta_weight;
            if(Error_Cost(1,iter)<cost_gate)
                flag=1;
                break;
            end
        end
        weight_global(:,date_1,date_2)=weight';
    end
end
 save weight_6_7_ming.mat weight_global -v7.3;


end