function [goal]=Target_Allocation(goal,quad_init_x,quad_init_y,num,target_num,goal_series,temp_goal,mirror_dis)
mirror_count=0;
quad_init=[quad_init_x quad_init_y];
distance=[sqrt((quad_init(1,1)-goal(1,1))^2+(quad_init(1,2)-goal(1,2))^2) sqrt((quad_init(1,1)-goal(2,1))^2+(quad_init(1,2)-goal(2,2))^2) sqrt((quad_init(1,1)-goal(3,1))^2+(quad_init(1,2)-goal(3,2))^2) sqrt((quad_init(1,1)-goal(4,1))^2+(quad_init(1,2)-goal(4,2))^2);
          sqrt((quad_init(2,1)-goal(1,1))^2+(quad_init(2,2)-goal(1,2))^2) sqrt((quad_init(2,1)-goal(2,1))^2+(quad_init(2,2)-goal(2,2))^2) sqrt((quad_init(2,1)-goal(3,1))^2+(quad_init(2,2)-goal(3,2))^2) sqrt((quad_init(2,1)-goal(4,1))^2+(quad_init(2,2)-goal(4,2))^2);
          sqrt((quad_init(3,1)-goal(1,1))^2+(quad_init(3,2)-goal(1,2))^2) sqrt((quad_init(3,1)-goal(2,1))^2+(quad_init(3,2)-goal(2,2))^2) sqrt((quad_init(3,1)-goal(3,1))^2+(quad_init(3,2)-goal(3,2))^2) sqrt((quad_init(3,1)-goal(4,1))^2+(quad_init(3,2)-goal(4,2))^2);
          sqrt((quad_init(4,1)-goal(1,1))^2+(quad_init(4,2)-goal(1,2))^2) sqrt((quad_init(4,1)-goal(2,1))^2+(quad_init(4,2)-goal(2,2))^2) sqrt((quad_init(4,1)-goal(3,1))^2+(quad_init(4,2)-goal(3,2))^2) sqrt((quad_init(4,1)-goal(4,1))^2+(quad_init(4,2)-goal(4,2))^2)];
      
distance_list=[sqrt((quad_init(1,1)-goal(1,1))^2+(quad_init(1,2)-goal(1,2))^2) sqrt((quad_init(1,1)-goal(2,1))^2+(quad_init(1,2)-goal(2,2))^2) sqrt((quad_init(1,1)-goal(3,1))^2+(quad_init(1,2)-goal(3,2))^2) sqrt((quad_init(1,1)-goal(4,1))^2+(quad_init(1,2)-goal(4,2))^2) ...,
              sqrt((quad_init(2,1)-goal(1,1))^2+(quad_init(2,2)-goal(1,2))^2) sqrt((quad_init(2,1)-goal(2,1))^2+(quad_init(2,2)-goal(2,2))^2) sqrt((quad_init(2,1)-goal(3,1))^2+(quad_init(2,2)-goal(3,2))^2) sqrt((quad_init(2,1)-goal(4,1))^2+(quad_init(2,2)-goal(4,2))^2) ...,
              sqrt((quad_init(3,1)-goal(1,1))^2+(quad_init(3,2)-goal(1,2))^2) sqrt((quad_init(3,1)-goal(2,1))^2+(quad_init(3,2)-goal(2,2))^2) sqrt((quad_init(3,1)-goal(3,1))^2+(quad_init(3,2)-goal(3,2))^2) sqrt((quad_init(3,1)-goal(4,1))^2+(quad_init(3,2)-goal(4,2))^2) ...,
              sqrt((quad_init(4,1)-goal(1,1))^2+(quad_init(4,2)-goal(1,2))^2) sqrt((quad_init(4,1)-goal(2,1))^2+(quad_init(4,2)-goal(2,2))^2) sqrt((quad_init(4,1)-goal(3,1))^2+(quad_init(4,2)-goal(3,2))^2) sqrt((quad_init(4,1)-goal(4,1))^2+(quad_init(4,2)-goal(4,2))^2);
              1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4;
              1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4];
distance_sort=distance_list;
for k=1:(num*target_num)
    for j=2:(num*target_num-k+1)
        if distance_sort(1,j-1)>distance_sort(1,j)
            Q=distance_sort(:,j-1);
            distance_sort(:,j-1)=distance_sort(:,j);
            distance_sort(:,j)=Q;
        end
    end
end
for k=1:(num*target_num)
    if (mirror_dis(distance_sort(2,k),distance_sort(3,k))~=2) && (mirror_count<3)
        mirror_dis(distance_sort(2,k),:)=2;
        mirror_dis(:,distance_sort(3,k))=2;
        mirror_dis(distance_sort(2,k),distance_sort(3,k))=1;
        mirror_count=mirror_count+1;
    end
end
for k=1:num
    for j=1:target_num
        if (mirror_dis(k,j)==1) || (mirror_dis(k,j)==0)
            goal_series(k)=j;
        end
    end
end
for k=1:target_num
    temp_goal(k,:)=goal(goal_series(k),:);
end
goal=temp_goal;
end
