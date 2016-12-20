package page;
 
public class page {
 
    private int totalRecord = 0;    // 전체 게시물 갯수
    private int numPerPage = 0;     // 한페이지에 보여지는 게시물 갯수
    private int pagePerBlock = 0;   // 페이지의 한 블럭
    private int totalPage = 0;      // 전체 페이지
    private int totalBlock = 0;     // 전체 블럭
    private Integer nowPage = 0;    // 현재 페이지
    private Integer nowBlock = 0;   // 현재 블럭
    private int beginPerPage = 0;   // 한페이지의 맨 위 게시물
}