<template>
  <div>
    <!--搜索栏-->
    <el-card id="search">
      <el-row>
        <el-col :span="20">
          <el-input v-model="searchModel.username" placeholder="用户名" clearable/>
          <el-input v-model="searchModel.phone" placeholder="手机号" clearable/>
          <el-button @click="getUserList" type="primary" icon="el-icon-search">查 询</el-button>
        </el-col>
        <el-col :span="4" align="right">
          <el-button type="primary" icon="el-icon-plus" @click="openEditUI(null)">添 加</el-button>
        </el-col>
      </el-row>
    </el-card>

    <!--结果列表-->
    <el-card>
      <el-table
        :data="userList"
        stripe
        style="width: 100%"
      >
        <el-table-column
          label="序号"
          width="80"
        >
          <template slot-scope="scope">
            {{ (searchModel.pageNo - 1) * searchModel.pageSize + scope.$index + 1 }}
          </template>
        </el-table-column>
        <el-table-column
          prop="id"
          label="用户ID"
          width="180"
        />
        <el-table-column
          prop="username"
          label="用户名"
          width="180"
        />
        <el-table-column
          prop="phone"
          label="手机号"
          width="220"
        />
        <el-table-column
          prop="status"
          label="用户状态"
          width="220"
        >
          <template slot-scope="scope">
            <el-tag v-if="scope.row.status === 1">正常</el-tag>
            <el-tag type="danger" v-if="scope.row.status === 0">禁用</el-tag>
          </template>
        </el-table-column>
        <el-table-column
          prop="email"
          label="电子邮箱"
          width="220"
        />
        <el-table-column
          label="操作"
          align="center"
        >
          <template slot-scope="scope">
            <el-button @click="openEditUI(scope.row.id)" type="warning" size="mini" icon="el-icon-edit"></el-button>
            <el-button @click="deleteUser(scope.row)" type="danger" size="mini" icon="el-icon-delete"></el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <!--  分页组件  -->
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="currentPage4"
      :page-sizes="[5, 10, 20, 50]"
      :page-size="searchModel.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total">
    </el-pagination>

    <!--  用户信息展示 新增修改..  -->
    <el-dialog @close="clearForm" :title="title" :visible.sync="dialogFormVisible">
      <el-form :model="userForm" :rules="rules" ref="userFormRef">
        <el-form-item label="用户名" prop="username" :label-width="formLabelWidth">
          <el-input v-model="userForm.username" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password" :label-width="formLabelWidth" v-if="userForm.id == null || userForm.id == undefined">
          <el-input type="password" v-model="userForm.password" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号" :label-width="formLabelWidth">
          <el-input v-model="userForm.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="用户状态" :label-width="formLabelWidth">
          <el-switch
            v-model="userForm.status"
            :active-value="1"
            :inactive-value="0"
          >
          </el-switch>
        </el-form-item>
        <el-form-item label="电子邮箱" prop="email" :label-width="formLabelWidth">
          <el-input v-model="userForm.email" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveUser">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import userApi from '@/api/userManage'

export default {
  data() {
    var checkEmail = (rule, value, callback) => {
      var reg = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/
      if (!reg.test(value)) {
        return callback(new Error('邮箱格式错误'))
      }
      callback()
    }
    return {
      total: 1,
      currentPage4: 1,
      searchModel: {
        pageNo: 1,
        pageSize: 10
      },
      userList: [],
      title: '',
      dialogFormVisible: false,
      userForm: {},
      formLabelWidth: '130px',
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 50, message: '长度在 3 到 50 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入登录初识密码', trigger: 'blur' },
          { min: 3, max: 50, message: '长度在 6 到 16 个字符', trigger: 'blur' }
        ],
        email: [
          { required: true, message: '请输入电子邮箱', trigger: 'blur' },
          { validator: checkEmail, trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    deleteUser(user) {
      this.$confirm(`确认删除用户 ${user.username} ?`, '删除提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        userApi.delById(user.id).then(res => {
          this.$message({
            type: 'success',
            message: res.message
          })
          this.getUserList()
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    clearForm() {
      this.userForm = {}
      this.$refs.userFormRef.clearValidate()
    },
    openEditUI(id) {
      if (id == null) {
        this.title = '新增用户'
      } else {
        this.title = '修改用户'
        // 根据id查询当前用户信息
        userApi.getUserById(id).then(res => {
          this.userForm = res.data
        })
      }
      this.dialogFormVisible = true
    },
    saveUser() {
      // 先触发表单验证
      this.$refs.userFormRef.validate((valid) => {
        if (valid) {
          // 提交请求给后台
          userApi.chooseSaveOrUpdate(this.userForm).then(res => {
            // 成功提示
            this.$message({
              message: res.message,
              type: 'success'
            })
            // 关闭对话框
            this.dialogFormVisible = false
            // 刷新表格
            this.getUserList()
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    handleSizeChange(pageSize) {
      this.searchModel.pageSize = pageSize
      this.getUserList()
    },
    handleCurrentChange(pageNo) {
      this.searchModel.pageNo = pageNo
      this.getUserList()
    },
    getUserList() {
      userApi.getUserList(this.searchModel).then(res => {
        this.userList = res.data.rows
        this.total = res.data.total
      })
    }
  },
  created() {
    this.getUserList()
  }
}
</script>

<style scoped>
#search .el-input {
  width: 200px;
  margin-right: 10px;
}
.el-dialog .el-input {
  width: 85%;
}
</style>
