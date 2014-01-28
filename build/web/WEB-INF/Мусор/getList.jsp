<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Integer> list = new ArrayList<Integer>();
    list.add(1234);
    list.add(12345);
    list.add(123456);
    for (Integer integer : list) {
        out.print(integer + "\n");
    }
    out.flush();
%>
