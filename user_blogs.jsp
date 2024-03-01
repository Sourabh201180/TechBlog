<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.Category,models.User,models.Blog" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone-min.js"></script>
    <link href="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <c:import url="header.jsp" />
    <c:import url="header2.jsp" />

    <!-- Add Product Modal -->
    <div class="modal fade" id="add_blog_modal">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">
                        <c:choose>
                            <c:when test="${uBlog eq null}"> 
                                Enter Blog Details
                            </c:when>
                            <c:otherwise>                                     
                                Update Blog Details
                            </c:otherwise>
                        </c:choose>
                    </h3>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="d-block" id="first">
                        <div class="form-group">
                            <label for="blg_name">Blog Title<span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="blog_name" id="blg_name" placeholder="Enter Blog title, which will be shown to readers" value="">
                        </div>
                        <div class="form-group">
                            <label for="blg_category">Category<span class="text-danger">*</span></label>
                            <select class="form-control dropdown" id="blg_category" name="blog_category" value=""></select>
                        </div>
                        <div class="form-group">
                            <label for="blg_sub_category">SubCategory<span class="text-danger">*</span></label>
                            <select class="form-control dropdown" id="blg_sub_category" name="blog_sub_category" value=""></select>
                        </div>
                        <div class="form-group">
                            <label for="blg_short_content">Short content:<span class="text-danger">*</span></label>
                            <textarea name="blog_short_content" id="blg_short_content" class="form-control" rows="3" placeholder="Write Sort Description about your Blog" value=""></textarea>
                        </div>
                        <div class="form-group mb-4">
                            <label for="blg_long_content">Long content:<span class="text-danger">*</span></label>
                            <textarea name="blog_long_content" id="blg_long_content" class="form-control" rows="5" placeholder="Write Long Description about your Blog" value=""></textarea>
                        </div>
                        <div class="form-group text-right mt-3 d-block" id="svAdBlog">
                            <button class="btn btn-info btn-sm" id="save_blog_btn">Save & Add Pics</button>
                        </div>
                        <div class="form-group text-right mt-3 d-none" id="upAdBlog">
                            <button class="btn btn-info btn-sm" id="update_blog_btn">Update & Add Pics</button>
                        </div>
                    </div>
                    <div class="d-none" id="second">
                        <label for="xyz">Upload Single(Primary) pic:<span class="text-danger">*</span></label>
                        <div class="dropzone" id="singlepicupload"></div>
                        <br>
                        <label for="xyz">Upload Multiple(Secondary) pics:<span class="text-danger">*</span></label>
                        <div class="dropzone" id="multiplepicupload"></div>
                        <br>
                        <input type="button" value="Upload" id="pic_btn" class="mb-2 btn btn-info btn-sm">
                    </div>
                    <div class="d-none" id="final_submit">
                        <div class="modal-footer d-block" id="svBlog">
                            <button type="submit" class="btn btn-primary" id="save_blog_pic_btn">Save Blog</button>
                        </div>
                        <div class="modal-footer d-none" id="upBlog">
                            <button type="submit" class="btn btn-primary" id="update_blog_pic_btn">Update Blog</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container-fluid">
        <c:import url="menu.jsp" />
        <nav class="mt-4">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="user_dashboard.jsp">Dashboard</a>
                </li>
                <li class="breadcrumb-item active" id="showP">Blogs</li>
            </ol>
        </nav>
        
        <div class="row">
            <div class="col text-right mt-2 mr-5">
                <button class="btn btn-secondary shadow" onclick="func5()">Add Blog</button>
            </div>
        </div>
    </div>
    
    <div class=" mt-4 container-fluid">
        <div class="row">
            <div class="col" id="hv">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach var="blog" items="${blogs}">
                    <div class="card md-4 mb-3 d-inline-block" style="max-width: 700px; border: 1px solid black;">
                        <div class="card" style="width: 21rem;">
                            <img src="download_image.do?blog_id=${blog.blogId}&count=1" onclick="func2('${blog.blogId}')" class="card-img-top" style="height: 200px; border: solid 1px black; margin: 3px3px" >
                            <div class="card-body" style="height: 300px">
                                <h5 class="card-title text-center" style="text-decoration:underline;" onclick="func2('${blog.blogId}')">${blog.name}</h5>
                                <hr>
                                <h6 class="card-title">${blog.smallDesc}</h6>
                                <div class="text-left">
                                    <a href="#" onclick="func2('${blog.blogId}')">read more...</a>
                                    <hr>
                                    <a href="delete_blog_review.do?count=1&blog_id=${blog.blogId}" class="text-right btn btn-primary btn-sm">Delete</a>
                                    &nbsp;
                                    <button class="btn btn-primary btn-sm" onclick="func4('${blog.blogId}')">Edit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </c:forEach>
            </div>
        </div>
    </div>

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    
    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

    <script>
        const upBlog = document.querySelector('#upBlog');
        const svBlog = document.querySelector('#svBlog');

        const svAdBlog = document.querySelector('#svAdBlog');
        const upAdBlog = document.querySelector('#upAdBlog');

        function func2(blogId) {
            window.location.href = "blog_info.do?blogId="+blogId;
        }

        function func5() {
            upAdBlog.classList.replace('d-block','d-none');
            svAdBlog.classList.replace('d-none','d-block');
            
            upBlog.classList.replace('d-block','d-none');
            svBlog.classList.replace('d-none','d-block');
            $('#add_blog_modal').modal('show');
        }

        ///////////////////////////////////////////////////
        const getCategory = async (categoryId) => {
            let response = await fetch('fetch_category.do?cid='+categoryId.categoryId);
            let result = await response.json();

            return result;
        };
        
        const getSubCategory = async (subCategoryId) => {
            let response = await fetch('fetch_sub_category.do?scid='+subCategoryId.subCategoryId);
            let result = await response.json();

            return result;
        };

        const getBlogInfo = async (blogId) => {
            let response = await fetch('edit_blog.do?bid='+blogId);
            let result = await response.json();

            return result;
        };

        var blog_id = null;
        function func4(blogId) {
            blog_id = blogId;
            getBlogInfo(blogId).then((data) => {
                svAdBlog.classList.replace('d-block','d-none');
                upAdBlog.classList.replace('d-none','d-block');

                blog_name.value = data.name;
                blog_short_content.value = data.smallDesc;
                blog_long_content.value = data.longDesc;

                // fetching subcategory info
                blog_sub_category1.innerHTML = null;
                getSubCategory(data.subCategory).then((data) => {
                    let elm = document.createElement('option');
                    elm.text = data.name;
                    elm.value = data.subCategoryId;
                    blog_sub_category1.append(elm);

                    // fetching category info
                    blog_category1.innerHTML = null;
                    getCategory(data.category).then((data) => {
                        var elm = document.createElement("option");
                        elm.text = data.category;
                        elm.value = data.categoryId;
                        blog_category1.appendChild(elm);
                    }).catch((err) => {
                        console.log(err);
                    });
                }).catch((err) => {
                    console.log(err);
                });
                
                svBlog.classList.replace('d-block','d-none');
                upBlog.classList.replace('d-none','d-block');
                $('#add_blog_modal').modal('show');
            }).catch((err)=>{
                console.log(err);
            });
        }

        var showP = document.querySelector('#showP');
        showP.addEventListener('click', () => {
            window.location.href = 'show_user_blogs_cards.do?uId=${user.userId}';
        });

        let singlepicupload = new Dropzone('#singlepicupload', {
            // 1 is just for differentiating between primary and secondary images
            url: 'upload_blog_file.do?count=1',
            uploadMultiple: false,
            maxFilesize: .5,
            acceptedFiles: 'image/jps, image/jpeg, image/png',
            autoProcessQueue: false,
            addRemoveLinks: true
        });
        
        let multiplepicupload = new Dropzone('#multiplepicupload', {
            // 2 is just for differentiating between primary and secondary images
            url: 'upload_blog_file.do?count=2',
            uploadMultiple: true,
            maxFilesize: 50,
            acceptedFiles: 'image/jps, image/jpeg, image/png',
            autoProcessQueue: false,
            addRemoveLinks: true,
            parallelUploads: 20
        });

        const pic_btn = document.querySelector('#pic_btn');
        pic_btn.addEventListener('click', () => {
            singlepicupload.processQueue();
            multiplepicupload.processQueue();
            console.log('successfully uploaded');
        });
        
        const save_blog_pic_btn = document.querySelector('#save_blog_pic_btn');
        save_blog_pic_btn.addEventListener('click', () => {
            window.location.href = 'show_user_blogs_cards.do?uId=${user.userId}';
            $('#add_blog_modal').modal('hide');
        });

        const update_blog_pic_btn = document.querySelector('#update_blog_pic_btn');
        update_blog_pic_btn.addEventListener('click', () => {
            $('#add_blog_modal').modal('hide');
        });

        var first = document.querySelector('#first');
        var second = document.querySelector('#second');
        var final_submit = document.querySelector('#final_submit');
        
        const blog_name = document.querySelector('#blg_name');
        const blog_short_content = document.querySelector('#blg_short_content');
        const blog_long_content = document.querySelector('#blg_long_content');
        const blog_category1 = document.querySelector('#blg_category');
        const blog_sub_category1 = document.querySelector('#blg_sub_category');

        const saveBlog = async () => {
            const url = 'add_update_blog.do?blog_name='+blog_name.value+'&blog_short_content='+blog_short_content.value+'&blog_long_content='+blog_long_content.value+'&blog_category1='+blog_category1.value+'&blog_sub_category1='+blog_sub_category1.value+'&add_update=1';
            console.log(url);

            let result = await fetch(url);
            let resp = await result.text();

            return resp;
        };
        
        var save_blog_btn = document.querySelector('#save_blog_btn');
        save_blog_btn.addEventListener('click', () => {
            saveBlog().then((data) => {
                first.classList.replace('d-block', 'd-none');
                second.classList.replace('d-none', 'd-block');
                final_submit.classList.replace('d-none', 'd-block');
            }).catch((err) => {
                console.log(err);
            });
        });

        const updateBlog = async () => {
            const url = 'add_update_blog.do?blog_name='+blog_name.value+'&blog_short_content='+blog_short_content.value+'&blog_long_content='+blog_long_content.value+'&blog_category1='+blog_category1.value+'&blog_sub_category1='+blog_sub_category1.value+'&add_update=2'+'&blog_id='+blog_id;
            console.log(url);

            let result = await fetch(url);
            let resp = await result.text();

            return resp;
        };

        var update_blog_btn = document.querySelector('#update_blog_btn');
        update_blog_btn.addEventListener('click', () => {
            updateBlog().then((data) => {
                first.classList.replace('d-block', 'd-none');
                second.classList.replace('d-none', 'd-block');
                final_submit.classList.replace('d-none', 'd-block');
            }).catch((err) => {
                console.log(err);
            });
        });

        function func(x) {
            if(x.value == 1) {
                if(x.checked) {
                    cont1.classList.replace('d-none', 'd-block');
                } else {
                    cont1.classList.replace('d-block', 'd-none');
                }
            } else if(x.value == 2) {
                if(x.checked) {
                    cont2.classList.replace('d-none', 'd-block');
                } else {
                    cont2.classList.replace('d-block', 'd-none');
                }
            } else{
                if(x.checked) {
                    cont3.classList.replace('d-none', 'd-block');
                } else {
                    cont3.classList.replace('d-block', 'd-none');
                }
            }
        }

        var blg_category = document.querySelector('#blg_category');
        var blg_sub_category = document.querySelector('#blg_sub_category');

        const category_list = document.querySelector('#category_list');
        const sub_category_list = document.querySelector('#sub_category_list');

        const categoryRequest = async () => {
            let result = await fetch('fetch_all_category.do');
            let tmp = await result.json();
            return tmp;
        }

        categoryRequest().then((data) => {
            blg_category.innerHTML = null;          
                for(var cat of data) {
                    var elm = document.createElement("option");
                    elm.text = cat.category;
                    elm.value = cat.categoryId;
                    blg_category.appendChild(elm);
                }
            }).catch((err) => {
                console.log(err);
            });

            const subCategoryRequest = async (category_id) => {
                let result = await fetch('fetch_all_sub_category.do?category_id='+category_id);
                let tmp = await result.json();
                return tmp;
            }

            blg_category.addEventListener('change', () => {
                let catId = blg_category.value;
                console.log(catId, '********~~~~');
                subCategoryRequest(catId).then((data) => {
                    console.log(data);
                    blg_sub_category.innerHTML = null;
                    for(var cat of data) {
                        let elm = document.createElement('option');
                        elm.text = cat.name;
                        elm.value = cat.subCategoryId;
                        blg_sub_category.append(elm);
                    }
                }).catch((err) => {
                    console.log(err);
                });
            });
    </script>
</body>
</html>