using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

[DataContract]
public class PwdData
{
    [DataMember]
    public string OldPwd { set; get; }

    [DataMember]
    public string NewPwd { set; get; }
}

[DataContract]
public class SuccessData
{
    [DataMember]
    public bool Success { set; get; }

    [DataMember]
    public string Result { set; get; }
}

[DataContract]
public class ValidData
{
    [DataMember]
    public bool valid { set; get; }
}

[DataContract]
public class UserData
{
    [DataMember]
    public String Name { set; get; }
}

[DataContract]
public class ChatData
{
    [DataMember]
    public string y { set; get; }

    [DataMember]
    public string a { set; get; }
}

[DataContract]
public class PageInfo
{
    public PageInfo()
    {
        data = new List<string[]>();
    }

    [DataMember]
    public int draw { set; get; }

    [DataMember]
    public int recordsTotal { set; get; }

    [DataMember]
    public int recordsFiltered { set; get; }

    [DataMember]
    public List<String[]> data { set; get; }
         
}

[DataContract]
public class ColumnInfo
{
    [DataMember]
    public int data { set; get; }

    [DataMember]
    public string name { set; get; }

    [DataMember]
    public bool searchable { set; get; }

    [DataMember]
    public bool orderable { set; get; }

    [DataMember]
    public SearchData search { set; get; }
}

[DataContract]
public class SearchData
{
    [DataMember]
    public string value { set; get; }

    [DataMember]
    public string regex { set; get; }
}

[DataContract]
public class OrderData
{
    [DataMember]
    public int column { set; get; }

    [DataMember]
    public String dir { set; get; }
}

[DataContract]
public class PageData
{
    [DataMember]
    public int draw { set; get; }

    [DataMember]
    public ColumnInfo[] columns { set; get; }

    [DataMember]
    public OrderData order { set; get; }

    [DataMember]
    public int start { set; get; }

    [DataMember]
    public int length { set; get; }

    [DataMember]
    public SearchData search { set; get; }
}



//树节点
[DataContract]
public class SicknessNode
{
    [DataMember]
    public string text { set; get; }

    [DataMember]
    public int id { set; get; }
}

