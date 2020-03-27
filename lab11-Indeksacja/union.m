function newArray = union(p,q,array)
    newArray = array;
    
    if p > q
        sID = q;
        eID = p;
    else
        sID = p;
        eID = q;
    end
    
    newArray(myroot(sID,array)) = myroot(eID,array);
end

