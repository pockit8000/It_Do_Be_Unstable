using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;

public class end : MonoBehaviour
{

    private void whenthisbitchends(string diditend)
    {
        if (diditend.Equals("yes"))
        {
            gameObject.GetComponent<SpriteRenderer>().enabled = false;
            SceneManager.LoadScene("galaxy_cadet", LoadSceneMode.Additive);          
        }
       SceneManager.sceneLoaded += OnSceneLoaded;
    }

    // called second
    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        Debug.Log("OnSceneLoaded: " + scene.name);
        SceneManager.SetActiveScene(SceneManager.GetSceneByName("galaxy_cadet"));
    }
}

