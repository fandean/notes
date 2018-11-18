

```xml
    <!-- 增加 -->
    <insert id="saveUser" parameterType="com.itheima.domain.User">
        <!-- 在插入操作后，返回自动生成的id -->
        <!--
            keyProperty="id"  实体类中属性的名称，查询完成后主键存放的位置
            keyColumn="id"  查询的字段名称
        -->
        <selectKey keyProperty="id" keyColumn="id" resultType="int" order="AFTER">
            select last_insert_id();
        </selectKey>

        insert into user(username,birthday,sex,address) value (#{username},#{birthday},#{sex},#{address})
    </insert>

```





