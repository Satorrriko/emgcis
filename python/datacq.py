def datacq(data_name,point_number,sample_angle):
    sample_number=len(data_name)//point_number
    print(sample_number)
    base=(len(data_name)%point_number)//2
    print(base)
    