create database techblogdb;

use techblogdb;

create table status 
(
    status_id int auto_increment primary key,
    status varchar(15) not null unique
);

insert into status (status) values ('Active'),('Inactive');
insert into status (status) value ('Blocked');

create table categories 
(
    category_id int auto_increment primary key,
    name varchar(50) not null
);

insert into categories (name) values 
('Programming Languages'), 
('DataStructure'), 
('DataBase'), 
('Cyber Security'), 
('Web Development'), 
('Android Development'), 
('Operating System');

create table sub_categories 
(
    sub_category_id int auto_increment primary key,
    name varchar(35) not null, 
    short_desc varchar(500) not null,
    pic varchar(200) not null, 
    category_id int not null,
    constraint fk_sub_categories foreign key (category_id) references categories (category_id)
);

insert into sub_categories (name, short_desc, pic, category_id) 
values
('Java', 'Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible', 'TechBlog/static/images/cards/c.jpg', 1),
('HTML','The HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser.','TechBlog/static/images/cards/html.jpg',5),
('CSS','Cascading Style Sheets (CSS) is a style sheet language used for describing the presentation of a document written in a markup language such as HTML or XML','TechBlog/static/images/cards/css.jpg',5),
('Javascript','JavaScript , often abbreviated as JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS.','TechBlog/static/images/cards/javascript.jpg',5),
('Kotlin','Kotlin is a cross-platform, statically typed, general-purpose high-level programming language with type inference.','TechBlog/static/images/cards/kotlin.jpg',6),
('LinkedList','A linked list is a linear collection of data elements called nodes each pointing to the next node by means of a pointer.','TechBlog/static/images/cards/linkedlist.jpg',2),
('SQL','SQL is a domain-specific language used in programming and designed for managing data held in a relational database management system (RDBMS)','TechBlog/static/images/cards/mysql.jpg',3),
('Linux','Linux is a family of open-source Unix-like operating systems based on the Linux kernel, an operating system kernel first released on September 17, 1991, by Linus Torvalds.','TechBlog/static/images/cards/linux.jpg',4),
('BootStrap','Bootstrap is a free and open-source CSS framework directed at responsive, mobile-first front-end web development.','TechBlog/static/images/cards/bootstrap.jpg',5),
('Java','Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible','TechBlog/static/images/cards/java.jpg',5),
('Python','Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation. Python is dynamically typed and garbage-collected.','TechBlog/static/images/cards/python.jpg',5),
('JSP','Java Server Pages (JSP) is a technology that allows developers to create dynamic web pages using a combination of HTML, XML, and Java code.','TechBlog/static/images/cards/jsp.jpg',5),
('Flutter','Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications for Android, iOS, Linux, macOS, Windows','TechBlog/static/images/cards/Flutter.jpg',6),
('Array','An array is a collection of items of same data type stored at contiguous memory locations.','TechBlog/static/images/cards/array.jpg',2),
('Stack','Stack is a linear data structure that follows a particular order in which the operations are performed.','TechBlog/static/images/cards/stack.jpg',2),
('Queue','A Queue is defined as a linear data structure that is open at both ends and the operations are performed in First In First Out (FIFO) order.','TechBlog/static/images/cards/queue.jpg',2);

UPDATE sub_categories
SET pic = 'static/images/cards/c.jpg'
WHERE sub_category_id=1;

UPDATE sub_categories
SET pic = 'static/images/cards/html.jpg'
WHERE sub_category_id=2;

UPDATE sub_categories
SET pic = 'static/images/cards/css.jpg'
WHERE sub_category_id=3;

UPDATE sub_categories
SET pic = 'static/images/cards/javascript.jpg'
WHERE sub_category_id=4;

UPDATE sub_categories
SET pic = 'static/images/cards/kotlin.jpg'
WHERE sub_category_id=5;

UPDATE sub_categories
SET pic = 'static/images/cards/linkedlist.jpg'
WHERE sub_category_id=6;

UPDATE sub_categories
SET pic = 'static/images/cards/mysql.jpg'
WHERE sub_category_id=7;

UPDATE sub_categories
SET pic = 'static/images/cards/linux.jpg'
WHERE sub_category_id=8;

UPDATE sub_categories
SET pic = 'static/images/cards/bootstrap.jpg'
WHERE sub_category_id=9;

UPDATE sub_categories
SET pic = 'static/images/cards/java.jpg'
WHERE sub_category_id=10;

UPDATE sub_categories
SET pic = 'static/images/cards/python.jpg'
WHERE sub_category_id=11;

UPDATE sub_categories
SET pic = 'static/images/cards/jsp.jpg'
WHERE sub_category_id=12;

UPDATE sub_categories
SET pic = 'static/images/cards/Flutter.jpg'
WHERE sub_category_id=13;

UPDATE sub_categories
SET pic = 'static/images/cards/flutter.jpg'
WHERE sub_category_id=13;

UPDATE sub_categories
SET pic = 'static/images/cards/array.jpg'
WHERE sub_category_id=14;

UPDATE sub_categories
SET pic = 'static/images/cards/stack.jpg'
WHERE sub_category_id=15;

UPDATE sub_categories
SET pic = 'static/images/cards/queue.jpg'
WHERE sub_category_id=16;

create table admins
(
    admin_id int auto_increment primary key,
    name varchar(35) not null,
    contact varchar(10) not null unique,
    email varchar(256),
    otp varchar(12),
    password varchar(200),
    pic varchar(200) not null,
    status_id int not null default 2,
    constraint fk_admins_status foreign key (status_id) references status (status_id)
);

create table users
(
    user_id int auto_increment primary key,
    name varchar(35) not null,
    contact varchar(10) not null unique,
    email varchar(256),
    otp varchar(12),
    password varchar(200),
    pic varchar(200) not null,
    about varchar(300),
    status_id int not null default 2,
    constraint fk_users_status foreign key (status_id) references status (status_id)
);

create table blogs 
(
    blog_id int auto_increment primary key,
    name varchar(35) not null,
    small_desc varchar(200) not null,
    long_desc varchar(5000),
    user_id int not null,
    status_id int not null default 5,
    sub_category_id int not null,
    constraint fk_blogs_users foreign key (user_id) references users (user_id),
    constraint fk_blogs_status foreign key (status_id) references status (status_id),
    constraint fk_blogs_sub_category foreign key (sub_category_id) references sub_categories (sub_category_id)
);

create table blog_images
(
    blog_image_id int auto_increment primary key,
    blog_id int not null,
    image varchar(200) not null,
    constraint fk_blog_images foreign key (blog_id) references blogs (blog_id)
);

create table reviews 
(
    review_id int primary key auto_increment,
    review varchar(1000) not null,
    user_id int not null,
    blog_id int not null,
    constraint fk_reviews_user foreign key (user_id) references users (user_id),
    constraint fk_reviews_blog foreign key (blog_id) references blogs (blog_id)
);