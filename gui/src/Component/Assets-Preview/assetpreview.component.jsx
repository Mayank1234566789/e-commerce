import React from 'react';
import '../Assets-Preview/assetpreview.component.css'
import Assets from '../Assets/assets.component';


const AssetPreview =({title,items}) =>(

    <div className='assets-preview'>
        <h1 className='title'>{title.toUpperCase()}</h1>
            <div className='preview'>
              {
                items.map(({id,...otherparams}) => <Assets key={id} {...otherparams}/> )
              }
            </div>
            
            </div>
)


export default AssetPreview;