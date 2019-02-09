<template>
    <div>
            <h2>Login</h2>
            <form @submit.prevent="handleSubmit">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input name="username" type="text" />
                    <div >Username is required</div>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input name="password" type="password" />
                    <div>Password is required</div>
                </div>
                <div class="form-group">
                    <button>Login</button>
                </div>
            </form>
    </div>
</template>

<script>
    export default {
        name : 'Login'
    }
</script>