<template>
  <nm-form-dialog ref="form" v-bind="form" v-on="on" :visible.sync="visible_">
    <el-row>
      <el-col :span="20" :offset="1">
        <el-form-item label="名称：" prop="name">
          <el-input v-model="form.model.name" />
        </el-form-item>
        <el-form-item label="编号：" prop="no">
          <el-input v-model.number="form.model.no" />
        </el-form-item>
        <el-form-item label="编码：" prop="code">
          <el-input v-model="form.model.code" />
        </el-form-item>
        <el-form-item label="版权声明：" prop="copyright">
          <el-input v-model="form.model.copyright" />
        </el-form-item>
      </el-col>
    </el-row>
  </nm-form-dialog>
</template>
<script>
import { mixins } from 'netmodular-ui'

const api = $api.codeGenerator.project

export default {
  mixins: [mixins.dialog],
  data() {
    return {
      form: {
        title: '添加项目',
        icon: 'add',
        width: '30%',
        action: api.add,
        labelWidth: '70px',
        model: {
          name: '',
          no: 0,
          code: '',
          copyright: ''
        },
        rules: {
          name: [
            { required: true, message: '请输入名称', trigger: 'blur' }
          ],
          code: [
            { required: true, message: '请输入编码', trigger: 'blur' }
          ],
          copyright: [
            { required: true, message: '请输入版权声明', trigger: 'blur' }
          ]
        }
      },
      on: {
        success: this.onSuccess,
        open: this.onOpen
      }
    }
  },
  methods: {
    onSuccess() {
      this.$emit('success')
    },
    onOpen() {
      this.$nextTick(() => {
        this.$refs.form.reset()
      })
    }
  }
}
</script>
