-- It's sample for test.
-- author: andy

-- Major
INSERT INTO major(year, name, info) VALUES('2010', '信息管理与信息系统', '信息管理与信息系统专业是一个很好很好很好的专业');
INSERT INTO major(year, name, info) VALUES('2011', '信息管理与信息系统', '信息管理与信息系统专业是一个很好很好很好的专业');

-- User
INSERT INTO user(name, email, passwd) VALUES('andy', 'aishuo2357@126.com', 'asvc9851');

-- Category
INSERT INTO category(name) VALUES('人文与社会科学类');
INSERT INTO category(name) VALUES('训练与健康类');
INSERT INTO category(name) VALUES('数学与自然科学类');
INSERT INTO category(name) VALUES('学科基础类');
INSERT INTO category(name) VALUES('专业类');
INSERT INTO category(name) VALUES('集中实践类');
INSERT INTO category(name) VALUES('创新与研修类');

-- Property
INSERT INTO property(name) VALUES('思想政治理论');
INSERT INTO property(name) VALUES('外语');
INSERT INTO property(name) VALUES('文化素质教育');
INSERT INTO property(name) VALUES('体育');
INSERT INTO property(name) VALUES('军事');
INSERT INTO property(name) VALUES('健康教育');
INSERT INTO property(name) VALUES('数学');
INSERT INTO property(name) VALUES('物理');
INSERT INTO property(name) VALUES('计算机');
INSERT INTO property(name) VALUES('学科基础');
INSERT INTO property(name) VALUES('专业核心');
INSERT INTO property(name) VALUES('专业选修');
INSERT INTO property(name) VALUES('课程设计');
INSERT INTO property(name) VALUES('实习');
INSERT INTO property(name) VALUES('毕业设计(论文)');
INSERT INTO property(name) VALUES('研究与创新');
INSERT INTO property(name) VALUES('跨学科选修');
INSERT INTO property(name) VALUES('学生创新实践计划(PSIP)');

-- Course
INSERT INTO course(name, category, property) VALUES('高等数学2A', 3, 7);
INSERT INTO course(name, category, property) VALUES('高等数学2B', 3, 7);
INSERT INTO course(name, category, property) VALUES('线性代数及其应用', 3, 7);
INSERT INTO course(name, category, property) VALUES('概率论', 3, 7);
INSERT INTO course(name, category, property) VALUES('大学物理概论', 3, 8);
INSERT INTO course(name, category, property) VALUES('物理实验A', 3, 8);
INSERT INTO course(name, category, property) VALUES('大学计算机基础', 3, 9);
INSERT INTO course(name, category, property) VALUES('计算机软件技术基础', 3, 9);
INSERT INTO course(name, category, property) VALUES('管理学', 4, 10);
INSERT INTO course(name, category, property) VALUES('经济学', 4, 10);
INSERT INTO course(name, category, property) VALUES('离散数学', 4, 10);
INSERT INTO course(name, category, property) VALUES('面向对象的程序设计', 4, 10);
INSERT INTO course(name, category, property) VALUES('应用统计学', 4, 10);
INSERT INTO course(name, category, property) VALUES('企业运营管理', 4, 10);
INSERT INTO course(name, category, property) VALUES('经济法', 4, 10);
INSERT INTO course(name, category, property) VALUES('工程经济学', 4, 10);
INSERT INTO course(name, category, property) VALUES('数据结构', 4, 10);
INSERT INTO course(name, category, property) VALUES('数据库原理与技术', 4, 10);
INSERT INTO course(name, category, property) VALUES('会计学', 4, 10);
INSERT INTO course(name, category, property) VALUES('运筹学', 4, 10);
INSERT INTO course(name, category, property) VALUES('企业财务管理', 4, 10);
INSERT INTO course(name, category, property) VALUES('学科与专业导论', 4, 10);
INSERT INTO course(name, category, property) VALUES('计算机硬件与集成', 4, 10);
INSERT INTO course(name, category, property) VALUES('JAVA与J2EE', 4, 10);
INSERT INTO course(name, category, property) VALUES('数值计算方法', 4, 10);
INSERT INTO course(name, category, property) VALUES('计算机网络基础与应用', 4, 10);
INSERT INTO course(name, category, property) VALUES('计算机信息安全', 4, 10);
INSERT INTO course(name, category, property) VALUES('UML原理与应用', 4, 10);
INSERT INTO course(name, category, property) VALUES('系统软件原理与技术', 4, 10);
INSERT INTO course(name, category, property) VALUES('信息系统分析与设计', 5, 11);
INSERT INTO course(name, category, property) VALUES('IT项目管理', 5, 11);
INSERT INTO course(name, category, property) VALUES('人工智能与专家系统', 5, 12);
INSERT INTO course(name, category, property) VALUES('ERP与供应链管理', 5, 12);
INSERT INTO course(name, category, property) VALUES('数据仓库与数据挖掘', 5, 12);
INSERT INTO course(name, category, property) VALUES('基于图形处理的信息系统', 5, 12);
INSERT INTO course(name, category, property) VALUES('专业前沿讨论班', 7, 16);
INSERT INTO course(name, category, property) VALUES('信息系统案例分析', 7, 16);
INSERT INTO course(name, category, property) VALUES('电子商务概论', 7, 17);
INSERT INTO course(name, category, property) VALUES('信息经济学', 7, 17);
INSERT INTO course(name, category, property) VALUES('专业课程设计', 6, 13);
INSERT INTO course(name, category, property) VALUES('计算机综合练习', 6, 13);
INSERT INTO course(name, category, property) VALUES('多媒体技术实践', 6, 13);
INSERT INTO course(name, category, property) VALUES('认识实习', 6, 14);
INSERT INTO course(name, category, property) VALUES('社会调查', 6, 14);
INSERT INTO course(name, category, property) VALUES('企业运营模拟(ERP沙盘)', 6, 14);
INSERT INTO course(name, category, property) VALUES('毕业设计(论文)', 6, 15);

-- MC: The relation between `major` and `course`.
INSERT INTO mc(major, course, credit) VALUES(2, 1, 6.0);
INSERT INTO mc(major, course, credit) VALUES(2, 2, 5.0);
INSERT INTO mc(major, course, credit) VALUES(2, 3, 3.5);
INSERT INTO mc(major, course, credit) VALUES(2, 4, 2.0);
INSERT INTO mc(major, course, credit) VALUES(2, 5, 4.0);
INSERT INTO mc(major, course, credit) VALUES(2, 6, 1.0);
INSERT INTO mc(major, course, credit) VALUES(2, 7, 0.0);
INSERT INTO mc(major, course, credit) VALUES(2, 8, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 9, 2.0);
INSERT INTO mc(major, course, credit) VALUES(2, 10, 4.0);
INSERT INTO mc(major, course, credit) VALUES(2, 11, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 12, 4.0);
INSERT INTO mc(major, course, credit) VALUES(2, 13, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 14, 2.0);
INSERT INTO mc(major, course, credit) VALUES(2, 15, 2.0);
INSERT INTO mc(major, course, credit) VALUES(2, 16, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 17, 4.0);
INSERT INTO mc(major, course, credit) VALUES(2, 18, 3.5);
INSERT INTO mc(major, course, credit) VALUES(2, 19, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 20, 4.0);
INSERT INTO mc(major, course, credit) VALUES(2, 21, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 22, 1.0);
INSERT INTO mc(major, course, credit) VALUES(2, 23, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 24, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 25, 2.5);
INSERT INTO mc(major, course, credit) VALUES(2, 26, 4.0);
INSERT INTO mc(major, course, credit) VALUES(2, 27, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 28, 2.0);
INSERT INTO mc(major, course, credit) VALUES(2, 29, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 30, 4.5);
INSERT INTO mc(major, course, credit) VALUES(2, 31, 3.5);
INSERT INTO mc(major, course, credit) VALUES(2, 32, 2.0);
INSERT INTO mc(major, course, credit) VALUES(2, 33, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 34, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 35, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 36, 1.0);
INSERT INTO mc(major, course, credit) VALUES(2, 37, 1.0);
INSERT INTO mc(major, course, credit) VALUES(2, 38, 2.0);
INSERT INTO mc(major, course, credit) VALUES(2, 39, 2.0);
INSERT INTO mc(major, course, credit) VALUES(2, 40, 4.0);
INSERT INTO mc(major, course, credit) VALUES(2, 41, 3.0);
INSERT INTO mc(major, course, credit) VALUES(2, 42, 4.0);
INSERT INTO mc(major, course, credit) VALUES(2, 43, 1.0);
INSERT INTO mc(major, course, credit) VALUES(2, 44, 2.0);
INSERT INTO mc(major, course, credit) VALUES(2, 45, 1.0);
INSERT INTO mc(major, course, credit) VALUES(2, 46, 12.0);

-- UC: The relation between `user` and `course`.
INSERT INTO uc(user, course, mark) VALUES(1, 1, 91.5);
INSERT INTO uc(user, course, mark) VALUES(1, 2, 92.5);
INSERT INTO uc(user, course, mark) VALUES(1, 3, 93.5);
-- Detail
INSERT INTO detail(name, course) VALUES('分析软件', 13);
INSERT INTO detail(name, course) VALUES('预测', 13);
INSERT INTO detail(name, course) VALUES('假设检验', 13);
INSERT INTO detail(name, course) VALUES('估计', 13);
INSERT INTO detail(name, course) VALUES('理论基础', 13);
INSERT INTO detail(name, course) VALUES('数据', 13);

INSERT INTO detail(name, course) VALUES('EXCEL', 13);
INSERT INTO detail(name, course) VALUES('SPSS', 13);
INSERT INTO detail(name, course) VALUES('R', 13);

INSERT INTO detail(name, course) VALUES('时间序列分析', 13);
INSERT INTO detail(name, course) VALUES('回归分析', 13);

INSERT INTO detail(name, course) VALUES('判别标准', 13);
INSERT INTO detail(name, course) VALUES('检验方法', 13);
INSERT INTO detail(name, course) VALUES('原假设', 13);

INSERT INTO detail(name, course) VALUES('估计对象', 13);
INSERT INTO detail(name, course) VALUES('估计方法', 13);
INSERT INTO detail(name, course) VALUES('样本容量确定', 13);

INSERT INTO detail(name, course) VALUES('大数定律', 13);
INSERT INTO detail(name, course) VALUES('中心极限定理', 13);
INSERT INTO detail(name, course) VALUES('正态分布', 13);

INSERT INTO detail(name, course) VALUES('类型', 13);
INSERT INTO detail(name, course) VALUES('可视化', 13);
INSERT INTO detail(name, course) VALUES('特征', 13);
INSERT INTO detail(name, course) VALUES('获取', 13);

-- CC: The relation among courses(课程).
INSERT INTO cc(tail, head) VALUES('1', '13');
INSERT INTO cc(tail, head) VALUES('1', '20');
INSERT INTO cc(tail, head) VALUES('1', '4');
INSERT INTO cc(tail, head) VALUES('1', '2');
INSERT INTO cc(tail, head) VALUES('2', '13');
INSERT INTO cc(tail, head) VALUES('2', '20');
INSERT INTO cc(tail, head) VALUES('2', '4');
INSERT INTO cc(tail, head) VALUES('3', '13');
INSERT INTO cc(tail, head) VALUES('3', '20');
INSERT INTO cc(tail, head) VALUES('4', '13');
INSERT INTO cc(tail, head) VALUES('4', '20');
INSERT INTO cc(tail, head) VALUES('7', '23');
INSERT INTO cc(tail, head) VALUES('7', '42');
INSERT INTO cc(tail, head) VALUES('7', '29');
INSERT INTO cc(tail, head) VALUES('7', '26');
INSERT INTO cc(tail, head) VALUES('7', '8');
INSERT INTO cc(tail, head) VALUES('8', '12');
INSERT INTO cc(tail, head) VALUES('8', '18');
INSERT INTO cc(tail, head) VALUES('9', '33');
INSERT INTO cc(tail, head) VALUES('9', '16');
INSERT INTO cc(tail, head) VALUES('9', '14');
INSERT INTO cc(tail, head) VALUES('10', '14');
INSERT INTO cc(tail, head) VALUES('10', '39');
INSERT INTO cc(tail, head) VALUES('10', '15');
INSERT INTO cc(tail, head) VALUES('10', '16');
INSERT INTO cc(tail, head) VALUES('11', '27');
INSERT INTO cc(tail, head) VALUES('11', '26');
INSERT INTO cc(tail, head) VALUES('11', '32');
INSERT INTO cc(tail, head) VALUES('11', '17');
INSERT INTO cc(tail, head) VALUES('12', '30');
INSERT INTO cc(tail, head) VALUES('12', '32');
INSERT INTO cc(tail, head) VALUES('12', '45');
INSERT INTO cc(tail, head) VALUES('12', '24');
INSERT INTO cc(tail, head) VALUES('12', '31');
INSERT INTO cc(tail, head) VALUES('13', '14');
INSERT INTO cc(tail, head) VALUES('13', '44');
INSERT INTO cc(tail, head) VALUES('14', '30');
INSERT INTO cc(tail, head) VALUES('17', '44');
INSERT INTO cc(tail, head) VALUES('17', '12');
INSERT INTO cc(tail, head) VALUES('17', '18');
INSERT INTO cc(tail, head) VALUES('18', '30');
INSERT INTO cc(tail, head) VALUES('18', '31');
INSERT INTO cc(tail, head) VALUES('18', '44');
INSERT INTO cc(tail, head) VALUES('18', '32');
INSERT INTO cc(tail, head) VALUES('19', '21');
INSERT INTO cc(tail, head) VALUES('19', '14');
INSERT INTO cc(tail, head) VALUES('20', '13');
INSERT INTO cc(tail, head) VALUES('20', '14');
INSERT INTO cc(tail, head) VALUES('21', '14');
INSERT INTO cc(tail, head) VALUES('23', '26');
INSERT INTO cc(tail, head) VALUES('24', '28');
INSERT INTO cc(tail, head) VALUES('25', '28');
INSERT INTO cc(tail, head) VALUES('25', '1');
INSERT INTO cc(tail, head) VALUES('25', '3');
INSERT INTO cc(tail, head) VALUES('25', '4');
INSERT INTO cc(tail, head) VALUES('26', '30');
INSERT INTO cc(tail, head) VALUES('29', '30');
INSERT INTO cc(tail, head) VALUES('31', '30');
INSERT INTO cc(tail, head) VALUES('33', '14');
INSERT INTO cc(tail, head) VALUES('44', '32');
INSERT INTO cc(tail, head) VALUES('38', '14');
INSERT INTO cc(tail, head) VALUES('39', '38');

-- DD: The relation among details(知识点).
INSERT INTO dd(tail, head) VALUES('1', '7');
INSERT INTO dd(tail, head) VALUES('1', '8');
INSERT INTO dd(tail, head) VALUES('1', '9');
INSERT INTO dd(tail, head) VALUES('2', '10');
INSERT INTO dd(tail, head) VALUES('2', '11');
INSERT INTO dd(tail, head) VALUES('3', '12');
INSERT INTO dd(tail, head) VALUES('3', '13');
INSERT INTO dd(tail, head) VALUES('3', '14');
INSERT INTO dd(tail, head) VALUES('4', '15');
INSERT INTO dd(tail, head) VALUES('4', '16');
INSERT INTO dd(tail, head) VALUES('4', '17');
INSERT INTO dd(tail, head) VALUES('5', '18');
INSERT INTO dd(tail, head) VALUES('5', '19');
INSERT INTO dd(tail, head) VALUES('5', '20');
INSERT INTO dd(tail, head) VALUES('6', '21');
INSERT INTO dd(tail, head) VALUES('6', '22');
INSERT INTO dd(tail, head) VALUES('6', '23');
INSERT INTO dd(tail, head) VALUES('6', '24');


--
-- Insert Mark.
--
INSERT INTO uc(user, course, mark) VALUES(1, 4, 75);
INSERT INTO uc(user, course, mark) VALUES(1, 5, 77);
INSERT INTO uc(user, course, mark) VALUES(1, 6, 79);
INSERT INTO uc(user, course, mark) VALUES(1, 7, 85);
INSERT INTO uc(user, course, mark) VALUES(1, 8, 85);
INSERT INTO uc(user, course, mark) VALUES(1, 9, 83);
INSERT INTO uc(user, course, mark) VALUES(1, 10, 70);
INSERT INTO uc(user, course, mark) VALUES(1, 11, 95);
INSERT INTO uc(user, course, mark) VALUES(1, 12, 77);
INSERT INTO uc(user, course, mark) VALUES(1, 13, 95);
INSERT INTO uc(user, course, mark) VALUES(1, 14, 85);
INSERT INTO uc(user, course, mark) VALUES(1, 15, 55);
INSERT INTO uc(user, course, mark) VALUES(1, 16, 97);
INSERT INTO uc(user, course, mark) VALUES(1, 17, 84);
INSERT INTO uc(user, course, mark) VALUES(1, 18, 89);
INSERT INTO uc(user, course, mark) VALUES(1, 19, 65);
INSERT INTO uc(user, course, mark) VALUES(1, 20, 69);
INSERT INTO uc(user, course, mark) VALUES(1, 21, 85);
INSERT INTO uc(user, course, mark) VALUES(1, 22, 80);
INSERT INTO uc(user, course, mark) VALUES(1, 23, 90);
INSERT INTO uc(user, course, mark) VALUES(1, 24, 85);
INSERT INTO uc(user, course, mark) VALUES(1, 25, 95);
INSERT INTO uc(user, course, mark) VALUES(1, 26, 79);
INSERT INTO uc(user, course, mark) VALUES(1, 27, 85);
INSERT INTO uc(user, course, mark) VALUES(1, 28, 88);
INSERT INTO uc(user, course, mark) VALUES(1, 29, 65);
INSERT INTO uc(user, course, mark) VALUES(1, 30, 95);
INSERT INTO uc(user, course, mark) VALUES(1, 31, 79);
INSERT INTO uc(user, course, mark) VALUES(1, 32, 80);
INSERT INTO uc(user, course, mark) VALUES(1, 33, 90);
INSERT INTO uc(user, course, mark) VALUES(1, 34, 92);

--
-- Some modifies during the building process.
--
UPDATE category SET color = '#209643' WHERE id = '1';
UPDATE category SET color = '#967720' WHERE id = '2';
UPDATE category SET color = '#EF7957' WHERE id = '3';
UPDATE category SET color = '#A21B4C' WHERE id = '4';
UPDATE category SET color = '#7F1BA2' WHERE id = '5';
UPDATE category SET color = '#6160CB' WHERE id = '6';
UPDATE category SET color = '#60CBC1' WHERE id = '7';
