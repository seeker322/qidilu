<template>
  <div>
    <textarea :id="id"></textarea>
  </div>
</template>

<script>
  export default {
    name: 'ckeditor4',
    props: [
      'value'
    ],


    mounted: function() {
      const self = this

      // 渲染编辑器
      self.ckeditor = window.CKEDITOR.replace(self.id)
      // 设置初始内容
      self.ckeditor.setData(self.value)

      // 监听内容变更事件
      self.ckeditor.on('change', function() {
        self.$emit('input', self.ckeditor.getData())
      })

      // setTimeout(function(){
      //   // 渲染编辑器
      //   self.ckeditor = window.CKEDITOR.replace(self.id, self.editorConfig);
      //   // 设置初始内容
      //   self.ckeditor.setData(self.value);
      //
      //   // 监听内容变更事件
      //   self.ckeditor.on("change", function() {
      //     self.$emit("input", self.ckeditor.getData());
      //   });
      // },100)



    },
    data: function() {
      return {
        id: parseInt(Math.random() * 10000).toString(),
        ckeditor: null,
        editorConfig: {
          toolbarGroups: [
            { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
            { name: 'styles', groups: [ 'styles' ] },
            { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
            { name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
            { name: 'forms', groups: [ 'forms' ] },
            { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
            { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
            { name: 'links', groups: [ 'links' ] },
            { name: 'insert', groups: [ 'insert' ] },
            { name: 'colors', groups: [ 'colors' ] },
            { name: 'tools', groups: [ 'tools' ] },
            { name: 'others', groups: [ 'others' ] }
          ],
          extraPlugins:'html5video_v1',
          // Remove some buttons provided by the standard plugins, which are
          // not needed in the Standard(s) toolbar.
          removeButtons :'Font,Save,NewPage,Preview,Print,Templates,Cut,Copy,Paste,PasteText,PasteFromWord,Find,Replace,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Outdent,Indent,Blockquote,CreateDiv,BidiLtr,BidiRtl,Language,Anchor,Flash,HorizontalRule,PageBreak,Iframe,About,Maximize,ShowBlocks,BGColor,TextColor';

          // Set the most common block elements.
          format_tags:'p;h1;h2;h3;pre',
          image_previewText:' ',
          filebrowserImageUploadUrl: "/admin/uploadImg",
          // Simplify the dialog windows.
          removeDialogTabs: 'image:advanced;link:advanced'
        }

      }
    },
    watch: {
      // 监听prop的变化，更新ckeditor中的值
      value: function() {
        if (this.value !== this.ckeditor.getData()) {
          this.ckeditor.setData(this.value)
        }
      }
    },
    // 销毁组件前，销毁编辑器
    beforeDestroy: function() {
      self.ckeditor.destroy()
    }
  }
</script>
