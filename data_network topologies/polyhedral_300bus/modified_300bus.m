
basecase_primal = case300;
basecase = ext2int(basecase_primal);
basecase.gen(:,9) = 10000;
basecase.gen(:,10) = 0;
basecase.branch(:,9) = 0;
basecase.gencost(:,5) = 0;
basecase.bus(:,5) = 0;
basecase.gencost(1:21,6) = 30*ones(21,1);
basecase.gencost(22:35,6) = 10*ones(14,1);
basecase.gencost(36:69,6) = 20*ones(34,1);

result = rundcopf(basecase);
basecase.branch(:,6) = 4*abs(result.branch(:,14));
for i = 1:BRAN
    if basecase.branch(i,6) < 1
        basecase.branch(i,6) = 50;
    end
end

