<script setup>
// element汉化
import zhCn from 'element-plus/es/locale/lang/zh-cn'
import { removeKey } from '@/core/auth.js'
import {useDark, useToggle} from "@vueuse/core";

useDark({
  selector:'html',
  attribute:'class',
  valueDark:'dark',
  valueLight:'light'
})

useDark({
  onChanged(dark) {useToggle(dark)}
})
const removeCookies = () => {
  removeKey('Authorization')
}
// test('should first', () => { second })
</script>

<template>
  <el-config-provider :locale="zhCn">
    <router-view />
  </el-config-provider>
</template>

<style scoped lang="less">
a {
 text-decoration: none !important;
}

</style>
