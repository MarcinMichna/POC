function root_ = myroot(index, array)
    root_ = index;
    
    while root_ ~= array(root_)
        root_ = array(root_);
    end
end

