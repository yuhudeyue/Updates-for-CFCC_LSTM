function predict2=Evaluate2_day30(date_1,date_2,date_3,date_4,testdata,day)


ma=3248.1;
% day=7;
yuce=30;
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
a=0;b=0;c=0;

predict2=zeros(yuce,date_3,date_4);
    load(['weight_6_30_ming' '.mat']);
    weight_global(1:6,:,:)=weight_global(1:6,:,:)+a;
    weight_global(7,:,:)=weight_global(7,:,:)+a;
    weight_global(8,:,:)=weight_global(8,:,:)+b;
    weight_global(9,:,:)=weight_global(9,:,:)+a;
    weight_global(10:11,:,:)=weight_global(10:11,:,:)+a;
    weight_global(12,:,:)=weight_global(12,:,:)+b;
    weight_global(13,:,:)=weight_global(13,:,:)+c;
    weight_global(14,:,:)=weight_global(14,:,:)+b;
    weight_global(15:16,:,:)=weight_global(15:16,:,:)+a;
    weight_global(17,:,:)=weight_global(17,:,:)+a;
    weight_global(18,:,:)=weight_global(18,:,:)+b;
    weight_global(19,:,:)=weight_global(19,:,:)+a;
    weight_global(20:25,:,:)=weight_global(20:25,:,:)+a;
    hidden_input_test=zeros(date_1,date_2);
    hidden_test=zeros(date_1,date_2);
d=1;
        for group_x = date_3:date_1
            for group_y = date_4:date_2
                hidden_input_test=weight_global(:,group_x,group_y)'*train_data(:,:,group_x,group_y);
                hidden_test=tanh(hidden_input_test);
                predict2(:,group_x,group_y)= hidden_test.*(ma);  
            end
        end


    predict2=double(int16(predict2));

    filename1 = ['predict2_30_',num2str(date_3),'_',num2str(date_1),'_',num2str(date_4),'_',num2str(date_2)];
    save(filename1,'predict2');


end