<script context="module">
  export async function load ({fetch}) {
    const res = await fetch('192.168.2.142:9999/task/all');

    const tasks = await res.json();

    if (res.ok) {
      return{
        props: {
          tasks
        }
      }
    }
    return {
      status: res.status,
      error: new Error()
    }
  }
</script>


<script>
  import { onMount } from "svelte";
  const BACKEND_URL = import.meta.env.VITE_BACKEND_URL;

  let res = "";
  let msg = "";

  async function getMessage() {
    res = await fetch('192.168.2.142:9999');
    msg = await res.json();
  }

  onMount(getMessage);

  export let tasks;
</script>

<div class="accordion" id="accordionExample">
  {#each tasks as task }
    <div class="accordion-item bg-dark">
      <h2 class="accordion-header" id="heading{ task.id }">
        <button class="accordion-button bg-dark" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{ task.id }" aria-expanded="true" aria-controls="collapse{ task.id }">
          <h1><p style="color:#b9b9b9;">{ task.title }</p></h1>
        </button>
      </h2>
      <div id="collapse{ task.id }" class="accordion-collapse collapse" aria-labelledby="heading{ task.id }" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <p style="color:#b9b9b9;">{ task.description }</p>
          <p>Deadline:  { task.deadline }</p>

          <form method="post" action="/done">
            <input type="hidden" id="toggle-state" name="status" value="{ task.id }">
            <button type="submit" class="btn btn-dark">Done</button>
          </form>
        </div>
      </div>
    </div>
    {/each}
    <div class="justify-content-center">
      <button class="btn btn-dark"><a href="#" style="color:#b9b9b9; text-decoration:none;"> <h2> + </h2></a></button>
    </div>
  </div>