<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>

<%
  // Specify the URL of the website to scrape
  String url = "https://www.facebook.com";

  // Connect to the website and retrieve the HTML content
  Document doc = Jsoup.connect(url).get();

  // Use CSS selectors to extract specific elements or data
  Elements elements = doc.select("a"); // Example: Select all h1 elements

  // Loop through the elements and display their text
  for (Element element : elements) {
    out.println(element.text());
  }
%>
