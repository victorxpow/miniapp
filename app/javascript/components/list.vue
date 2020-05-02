<template>
  <div class="list">
    <h5><a :href="'/lists/' + list.id">{{ list.name }}</a></h5>
    <draggable v-model="list.tasks" :options="{group: 'tasks'}" class="dragArea" @change="taskMoved">
      <task v-for="task in list.tasks" :task="task" :list="list" ></task>
    </draggable>

    <a v-if="!editing" v-on:click="editing=true">Adicionar Tarefa</a>
    <textarea v-if="editing" ref="message" v-model="message" class="form-control mb-1"></textarea>
    <button v-on:click="submitMessage" v-if="editing" class="btn btn-primary">Adicionar</button>
    <a v-on:click="editing=false" v-if="editing" >Cancelar</a>
  </div>
</template>

<script>
  import draggable from 'vuedraggable'
  import task from 'components/task'

  export default {
    components: { task, draggable },
    props: ["list"],

    data: function() {
      return {
        editing: false,
        message: ""
      }
    },

    methods: {
      startEditing: function() {
        this.editing = true
        this.$nextTick(() => { this.$refs.message.focus() })
      },

      taskMoved: function(event) {
        const evt = event.added || event.moved
        if (evt == undefined) { return }
        const element = evt.element
        const list_index = window.store.state.lists.findIndex((list) => {
          return list.tasks.find((task) => {
            return task.id === element.id
          })
        })
        var data = new FormData
        data.append("task[list_id]", window.store.state.lists[list_index].id)
        data.append("task[position]", evt.newIndex + 1)
        Rails.ajax({
          beforeSend: () => true,
          url: `/tasks/${element.id}/move`,
          type: "PATCH",
          data: data,
          dataType: "json"
        })
      },

      submitMessage: function() {
        var data = new FormData
        data.append("task[list_id]", this.list.id)
        data.append("task[title]", this.message)

        Rails.ajax({
          beforeSend: () => true,
          url: "/tasks",
          type: "POST",
          data: data,
          dataType: "json",
          success: (data) => {
            const index = window.store.lists.findIndex(item => item.id == this.list.id)
            window.store.lists[index].tasks.push(data)
            this.message = ""
            this.$nextTick(() => { this.$refs.message.focus() })
          }
        })
      }
    }
  }
</script>

<style scoped>

</style>
