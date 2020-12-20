/**
 * @license Copyright (c) 2003-2020, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
    // Define changes to default configuration here.
    // For complete reference see:
    // https://ckeditor.com/docs/ckeditor4/latest/api/CKEDITOR_config.html

    // The toolbar groups arrangement, optimized for two toolbar rows.


    config.toolbarGroups = [
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
    config.extraPlugins = 'html5video_v1'
    // Remove some buttons provided by the standard plugins, which are
    // not needed in the Standard(s) toolbar.
    config.removeButtons ='Font,Save,NewPage,Preview,Print,Templates,Cut,Copy,Paste,PasteText,PasteFromWord,Find,Replace,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Outdent,Indent,Blockquote,CreateDiv,BidiLtr,BidiRtl,Language,Anchor,Flash,HorizontalRule,PageBreak,Iframe,About,Maximize,ShowBlocks,BGColor,TextColor';

    // Set the most common block elements.
    config.format_tags = 'p;h1;h2;h3;pre';
    config.image_previewText=' ';
    config.filebrowserImageUploadUrl= "admin/uploadAticalImg";
    // Simplify the dialog windows.
    config.removeDialogTabs = 'image:advanced;link:advanced';

    // config.toolbar = 'Full';
    // config.toolbar_Full = [
    //     {name: 'document',items: ['Source', '-', 'DocProps', 'Preview', 'Print', '-']},
    //     {name: 'clipboard',items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo']},
    //     {name: 'editing',items: ['Find', 'Replace', '-', 'SelectAll', '-']},
    //     { name: 'basicstyles',items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']},
    //
    //     {name: 'paragraph',items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']},
    //     {name: 'links',items: ['Link', 'Unlink', 'Anchor']},
    //     {name: 'insert',items: ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak']},
    //
    //     { name: 'styles',items: ['Styles', 'Format', 'Font', 'FontSize']},
    //     { name: 'colors',items: ['TextColor', 'BGColor']},
    //     { name: 'tools',items: [ 'ShowBlocks', '-']}
    // ];
    // config.toolbar_Basic = [['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink', '-', 'About']];
};
