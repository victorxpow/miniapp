<template>
<div>
  <div @click="editing=true" class="card card-body mb-3">
    <h6>{{ task.title }}</h6>
  </div>

  <div v-if='editing' class="modal-backdrop show"></div>

  <div v-if='editing' @click="closeModal" class="modal show" style="display: block">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">{{ task.title }}</h5>
        </div>
        <div class="modal-body">
          <input v-model="title" class="form-control"></input>
        </div>
        <div class="modal-footer">
          <button @click="save" type="button" class="btn btn-primary">Salvar alterações</button>
        </div>
      </div>
    </div>
  </div>
</div>
</template>

<script>
  export default {
    props: ['task', 'list'],
    data: function() {
      return {
        editing: false,
        title: this.task.title,
      }
    },

    methods: {
      closeModal: function(event) {
        if(event.target.classList.contains("modal")) {
          this.editing = false
        }
      },
          save: function() {
      var data = new FormData
      data.append("task[title]", this.title)
      Rails.ajax({
        beforeSend: () => true,
        url: `/tasks/${this.task.id}`,
        type: "PATCH",
        data: data,
        dataType: "json",
        success: (data) => {
          this.editing = false
        }
      })
    },
  }
}
</script>

<style scoped>

</style>
