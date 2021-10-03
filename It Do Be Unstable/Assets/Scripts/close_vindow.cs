using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;

public class close_vindow : MonoBehaviour
{
    private void Update()
    {
        if (Input.GetMouseButtonDown(0))
        { // mouse click
            Vector3 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
            Vector2 mousePos2D = new Vector2(mousePos.x, mousePos.y);
            RaycastHit2D hit = Physics2D.Raycast(mousePos2D, Vector2.zero);
            if (hit.collider?.gameObject.name == "closes")
            {//check to see what object it is
                SceneManager.UnloadSceneAsync("galaxy_cadet".ToString());
                
            }
        }
    }
}
