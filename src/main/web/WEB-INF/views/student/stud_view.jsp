<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/header.jsp" >
    <c:param name="title" value="Student Search" />
</c:import>
<div class="main_contents">
    <div id="sub_content">
        <form:form class="row g-3 mt-3 ms-2" action="/studView/search" method="post" modelAttribute="student">
            <div class="col-auto">
                <label for="studId" class="visually-hidden">studentID</label>
                <form:input type="text"  class="form-control" id="studId" placeholder="Student ID" path="id" />
            </div>
            <div class="col-auto">
                <label for="studName" class="visually-hidden">studentName</label>
                <form:input type="text" class="form-control" id="studName" placeholder="Student Name" path="name" />
            </div>
            <div class="col-auto">
                <label for="studcoures" class="visually-hidden">Course</label>
                <input type="text" class="form-control" id="studcoures" placeholder="Course" name="course" />
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3 " >
                    Search
                </button>
            </div>
            <div class="col-auto">
                <button type="reset" class="btn btn-danger mb-3" >
                    Rest
                </button>

                <!--model-->
                <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel3">My Apologize</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Sorry , Doesn't Support this Feature Yet! <br><br>
                                Developing in progress.... :)
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
        <div>
            <table class="table table-striped" id="stduentTable">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Photo</th>
                    <th scope="col">Date of Birth</th>
                    <th scope="col">Courses</th>
                    <th scope="col">Details</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${students}" var="stud" varStatus="loop">
                    <tr>
                        <th scope="row">${loop.index+1}</th>
                        <td>${stud.name}</td>
                        <td><img src="../assets/imgs/${stud.photo}" alt="no photo" width="60px" height="60px"></td>
                        <td>${stud.dob}</td>
                        <!-- Iterate through courses and display without brackets -->
                        <td>
                            <c:forEach items="${stud.courses}" var="course" varStatus="courseLoop">
                                ${fn:trim(course.name)}<c:if test="${!courseLoop.last}">, </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/studDetail?id=${stud.id}"><button type="submit" class="btn btn-secondary mb-2">See More</button></a>
                        </td>
                        <td></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp" />
