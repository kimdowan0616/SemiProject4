<%@page contentType="text/html; charset=euc-kr" %>
<%@page import="java.util.Date" %>
<!-- page ������(��Ƽ��) - page�� ���� ���� ���� -->
<%
//��ũ��Ʈ�� - jsp �ڵ带 �ִ� ��
Date d = new Date();
String now = d.toLocaleString();
out.print(now); //out => jsp�� ���� ��ü, out.print() =>�� �������� ����϶�� ��
/*�ڹ��� ���� �� �ּ�*/
//�ڹ��� ���� �ּ�
%>
<html>
<body>
<h1>jsp ����</h1>
���� ��¥�� <%=d%> �Դϴ�.
<!-- ǥ���� => out.print(d)�� ���� -->
<!--html �ּ�-->
<%--jsp �ּ� --%>
</body>
</html>
<!--http://localhost:9090/testsite/now1.jsp-->