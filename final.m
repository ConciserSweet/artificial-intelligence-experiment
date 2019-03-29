openlist = [];
closedlist = [];
init = [2 8 3;1 6 4;7 0 5];%初始
target = [1 2 3;8 0 4;7 6 5];%目标

init = init(:);
init = [init;5];
openlist = [openlist,init];
closedlist = [closedlist,init];

for i = 1:1:100
     f_node = openlist(:,1);
     closedlist = [closedlist,f_node];
     f_node(10) = [];
     f_node = reshape(f_node,3,3);
     [zero_row,zero_col] = find(f_node == 0);
     
     %判断是否break
    zero_temp = f_node - target;
    zero_cr = find(zero_temp);
    w = length(zero_cr);
    if w == 0
        %f_node 9 
        f_node
        i
        break;
    end
    
    %left move
    if zero_col ~= 1
        node = f_node;
        temp = node(zero_row,zero_col);
        node(zero_row,zero_col) = node(zero_row,zero_col-1);
        node(zero_row,zero_col-1) = temp;
     %判断w值
     zero_temp = node - target;
     zero_cr = find(zero_temp);
     w = length(zero_cr);
     node = node(:);
     
     %判断是否在closedlist中
     [closed_row,closed_col] = size(closedlist);
     for j = 1:1:closed_col
         closed_temp = closedlist(:,j);
         closed_temp(10) = [];
         zero_temp = node - closed_temp;
         zero_cr = find(zero_temp);
         w = length(zero_cr);
         if w == 0
             flag = 1;
             break;
         else flag = 0;
         end
     end
     if flag == 0
        node = [node;i+w];
        openlist = [openlist,node];
     end
    end
    
     %right move
    if zero_col ~= 3
        node = f_node;
        temp = node(zero_row,zero_col);
        node(zero_row,zero_col) = node(zero_row,zero_col+1);
        node(zero_row,zero_col+1) = temp;
     %判断w值
     zero_temp = node - target;
     zero_cr = find(zero_temp);
     w = length(zero_cr);
     node = node(:);
     
     %判断是否在closedlist中
     [closed_row,closed_col] = size(closedlist);
     for j = 1:1:closed_col
         closed_temp = closedlist(:,j);
         closed_temp(10) = [];
         zero_temp = node - closed_temp;
         zero_cr = find(zero_temp);
         w = length(zero_cr);
         if w == 0
             flag = 1;
             break;
         else flag = 0;
         end
     end
     if flag == 0
        node = [node;i+w];
        openlist = [openlist,node];
     end
    end
     
     %up move
    if zero_row ~= 1
        node = f_node;
        temp = node(zero_row,zero_col);
        node(zero_row,zero_col) = node(zero_row-1,zero_col);
        node(zero_row-1,zero_col) = temp;
     %判断w值
     zero_temp = node - target;
     zero_cr = find(zero_temp);
     w = length(zero_cr);
     node = node(:);
     
     %判断是否在closedlist中
     [closed_row,closed_col] = size(closedlist);
     for j = 1:1:closed_col
         closed_temp = closedlist(:,j);
         closed_temp(10) = [];
         zero_temp = node - closed_temp;
         zero_cr = find(zero_temp);
         w = length(zero_cr);
         if w == 0
             flag = 1;
             break;
         else flag = 0;
         end
     end
     if flag == 0
        node = [node;i+w];
        openlist = [openlist,node];
     end
    end
     
     %down move
    if zero_row ~= 3
        node = f_node;
        temp = node(zero_row,zero_col);
        node(zero_row,zero_col) = node(zero_row+1,zero_col);
        node(zero_row+1,zero_col) = temp;
    
     %判断w值
     zero_temp = node - target;
     zero_cr = find(zero_temp);
     w = length(zero_cr);
     node = node(:);
     
     %判断是否在closedlist中
     [closed_row,closed_col] = size(closedlist);
     for j = 1:1:closed_col
         closed_temp = closedlist(:,j);
         closed_temp(10) = [];
         zero_temp = node - closed_temp;
         zero_cr = find(zero_temp);
         w = length(zero_cr);
         if w == 0
             flag = 1;
             break;
         else flag = 0;
         end
     end
     if flag == 0
        node = [node;i+w];
        openlist = [openlist,node];
     end
    end
     
     openlist(:,1) = [];
     %排序
     [open_row,open_col] = size(openlist);
     for m = 1:1:open_col
        for n = 1:1:open_col-m
            if openlist(10,n) > openlist(10,n+1)
                zero_temp = openlist(:,n);
                openlist(:,n) = openlist(:,n+1);
                openlist(:,n+1) = zero_temp;
            end
        end
    end
    
end
